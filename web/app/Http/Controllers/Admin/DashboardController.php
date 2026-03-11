<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Room;
use App\Models\Contract;
use App\Models\Invoice;
use App\Models\Issue;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $stats = [
            'total_rooms' => Room::count(),
            'empty_rooms' => Room::where('status', 'available')->count(),
            'rented_rooms' => Room::where('status', 'rented')->count(),
            'occupancy_rate' => Room::count() > 0 ? (Room::where('status', 'rented')->count() / Room::count()) * 100 : 0,
            'pending_revenue' => Invoice::where('status', 'unpaid')->sum('total_amount'),
            'active_issues' => Issue::where('status', '!=', 'resolved')->count(),
            'expiring_contracts_count' => Contract::where('status', 'active')->where('end_date', '<=', now()->addDays(30))->count(),
        ];

        $recentInvoices = Invoice::with(['contract.room', 'contract.tenant'])->latest()->take(5)->get();
        $recentTenants = Contract::with(['tenant', 'room'])->where('status', 'active')->latest()->take(5)->get();
        $expiringContracts = Contract::with(['tenant', 'room'])->where('status', 'active')->where('end_date', '<=', now()->addDays(30))->orderBy('end_date')->get();

        return view('admin.dashboard', compact('stats', 'recentInvoices', 'recentTenants', 'expiringContracts'));
    }
}
