<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\Room;
use App\Models\User;
use Illuminate\Http\Request;

class ContractController extends Controller
{
    public function index(Request $request)
    {
        $query = Contract::with(['room', 'tenant']);

        // Search by tenant name
        if ($request->has('search')) {
            $query->whereHas('tenant', function($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%');
            });
        }

        // Filter by status
        if ($request->has('status') && $request->status != '') {
            $query->where('status', $request->status);
        }

        // Sorting
        $sortField = $request->get('sort', 'created_at');
        $sortOrder = $request->get('order', 'desc');
        $query->orderBy($sortField, $sortOrder);

        $contracts = $query->paginate(10)->withQueryString();
        
        return view('admin.contracts.index', compact('contracts'));
    }

    public function create()
    {
        $rooms = Room::where('status', 'empty')->get();
        $tenants = User::where('role', 'tenant')->get();
        return view('admin.contracts.create', compact('rooms', 'tenants'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'room_id' => 'required|exists:rooms,id',
            'tenant_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'deposit' => 'required|numeric',
        ]);

        $contract = Contract::create($request->all());
        
        // Update room status
        $contract->room->update(['status' => 'rented']);

        return redirect()->route('contracts.index')->with('success', 'Tạo hợp đồng thành công.');
    }

    public function show(Contract $contract)
    {
        $contract->load(['room.building', 'tenant', 'invoices']);
        return view('admin.contracts.show', compact('contract'));
    }

    public function edit(Contract $contract)
    {
        $rooms = Room::all();
        $tenants = User::where('role', 'tenant')->get();
        return view('admin.contracts.edit', compact('contract', 'rooms', 'tenants'));
    }

    public function update(Request $request, Contract $contract)
    {
        $request->validate([
            'room_id' => 'required|exists:rooms,id',
            'tenant_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
            'monthly_rent' => 'required|numeric',
            'deposit' => 'required|numeric',
            'status' => 'required|in:active,expired,cancelled',
        ]);

        $contract->update($request->all());
        return redirect()->route('contracts.index')->with('success', 'Cập nhật hợp đồng thành công.');
    }

    public function destroy(Contract $contract)
    {
        // Revert room status if active
        if ($contract->status == 'active') {
            $contract->room->update(['status' => 'empty']);
        }
        $contract->delete();
        return redirect()->route('contracts.index')->with('success', 'Xóa hợp đồng thành công.');
    }
}
