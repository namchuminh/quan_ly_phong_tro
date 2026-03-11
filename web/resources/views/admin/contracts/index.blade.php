@extends('layouts.admin')

@section('title', 'Quản lý Hợp đồng')

@section('content')
<div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
    <div>
        <h1 class="text-3xl font-bold text-gray-900">Danh sách Hợp đồng</h1>
        <p class="text-gray-500 mt-1 text-sm leading-5">Quản lý các thỏa thuận thuê phòng, tiền cọc và thời hạn hợp đồng.</p>
    </div>
    <a href="{{ route('contracts.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2.5 rounded-xl font-bold transition shadow-sm flex items-center">
        <i class="fas fa-plus mr-2 text-sm"></i>
        Tạo hợp đồng mới
    </a>
</div>

<!-- Search & Filter Card -->
<div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 mb-8">
    <form action="{{ route('contracts.index') }}" method="GET" class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div class="md:col-span-2">
            <label class="block text-sm font-semibold text-gray-700 mb-1 leading-5">Tìm kiếm khách thuê</label>
            <div class="relative">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                    <i class="fas fa-search text-sm"></i>
                </span>
                <input type="text" name="search" value="{{ request('search') }}" class="w-full pl-10 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition" placeholder="Nhập tên khách thuê...">
            </div>
        </div>
        <div>
            <label class="block text-sm font-semibold text-gray-700 mb-1 leading-5">Trạng thái</label>
            <select name="status" class="w-full px-4 py-2 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition appearance-none">
                <option value="">Tất cả trạng thái</option>
                <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Đang hiệu lực</option>
                <option value="expired" {{ request('status') == 'expired' ? 'selected' : '' }}>Hết hạn</option>
                <option value="terminated" {{ request('status') == 'terminated' ? 'selected' : '' }}>Đã chấm dứt</option>
            </select>
        </div>
        <div class="flex items-end space-x-2">
            <button type="submit" class="flex-1 bg-gray-900 text-white font-bold py-2 rounded-xl hover:bg-black transition text-sm">Lọc dữ liệu</button>
            <a href="{{ route('contracts.index') }}" class="px-4 py-2 bg-gray-100 text-gray-600 font-bold rounded-xl hover:bg-gray-200 transition text-sm flex items-center justify-center">
                <i class="fas fa-undo"></i>
            </a>
        </div>
    </form>
</div>

<div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
    <div class="overflow-x-auto">
        <table class="w-full text-left">
            <thead class="bg-gray-50 border-b border-gray-100">
                <tr>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Phòng</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Khách thuê</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">
                        <a href="{{ request()->fullUrlWithQuery(['sort' => 'start_date', 'order' => request('order') === 'asc' ? 'desc' : 'asc']) }}" class="flex items-center">
                            Thời hạn
                            <i class="fas fa-sort ml-2 opacity-30"></i>
                        </a>
                    </th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider text-right">Tiền cọc</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Trạng thái</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider text-right">Thao tác</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                @forelse($contracts as $contract)
                <tr class="hover:bg-gray-50 transition group">
                    <td class="px-6 py-4 font-bold text-gray-900">{{ $contract->room->room_number }}</td>
                    <td class="px-6 py-4">
                        <div class="text-sm font-bold text-gray-900">{{ $contract->tenant->name }}</div>
                        <div class="text-[10px] text-gray-400">{{ $contract->tenant->phone }}</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-xs font-bold text-gray-700">{{ $contract->start_date->format('d/m/Y') }}</div>
                        <div class="text-[10px] text-gray-400">đến {{ $contract->end_date ? $contract->end_date->format('d/m/Y') : 'Không thời hạn' }}</div>
                    </td>
                    <td class="px-6 py-4 text-right font-bold text-indigo-600 text-sm">
                        {{ number_format($contract->deposit, 0, ',', '.') }} đ
                    </td>
                    <td class="px-6 py-4">
                        @php
                            $statusMap = [
                                'active' => ['label' => 'Đang hiệu lực', 'class' => 'text-green-600 bg-green-50'],
                                'expired' => ['label' => 'Hết hạn', 'class' => 'text-red-600 bg-red-50'],
                                'terminated' => ['label' => 'Chấm dứt', 'class' => 'text-gray-600 bg-gray-50'],
                            ];
                            $st = $statusMap[$contract->status] ?? ['label' => $contract->status, 'class' => 'text-gray-600 bg-gray-50'];
                        @endphp
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-tight {{ $st['class'] }}">
                            {{ $st['label'] }}
                        </span>
                    </td>
                    <td class="px-6 py-4 text-right space-x-2">
                        <a href="{{ route('contracts.show', $contract) }}" class="text-indigo-600 hover:bg-indigo-50 p-2 rounded-lg transition inline-block" title="Xem chi tiết">
                            <i class="fas fa-eye"></i>
                        </a>
                        <a href="{{ route('contracts.edit', $contract) }}" class="text-amber-500 hover:bg-amber-50 p-2 rounded-lg transition inline-block" title="Chỉnh sửa">
                            <i class="fas fa-edit"></i>
                        </a>
                        <form action="{{ route('contracts.destroy', $contract) }}" method="POST" class="inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-rose-500 hover:bg-rose-50 p-2 rounded-lg transition inline-block" onclick="return confirm('Xóa hợp đồng này?')" title="Xóa">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="px-6 py-12 text-center text-gray-500 italic">Không tìm thấy hợp đồng nào phù hợp.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if($contracts->hasPages())
    <div class="px-6 py-4 bg-gray-50 border-t border-gray-100">
        {{ $contracts->links() }}
    </div>
    @endif
</div>
@endsection
