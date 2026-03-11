@extends('layouts.admin')

@section('title', 'Quản lý Phòng')

@section('content')
<div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
    <div>
        <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Danh sách Phòng</h1>
        <p class="text-gray-500 mt-1 text-sm">Quản lý thông tin, tình trạng và gán khách thuê cho từng phòng.</p>
    </div>
    <a href="{{ route('rooms.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-3 rounded-2xl font-bold transition shadow-xl shadow-indigo-100/50 flex items-center text-sm">
        <i class="fas fa-plus mr-2"></i>
        Thêm phòng mới
    </a>
</div>

<!-- Search & Filter Card -->
<div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 mb-8">
    <form action="{{ route('rooms.index') }}" method="GET" class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div>
            <label class="block text-sm font-semibold text-gray-700 mb-1 leading-5">Tìm kiếm số phòng</label>
            <div class="relative">
                <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                    <i class="fas fa-search text-sm"></i>
                </span>
                <input type="text" name="search" value="{{ request('search') }}" class="w-full pl-10 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition" placeholder="Nhập số phòng...">
            </div>
        </div>
        <div>
            <label class="block text-sm font-semibold text-gray-700 mb-1 leading-5">Tòa nhà</label>
            <select name="building_id" class="w-full px-4 py-2 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition appearance-none">
                <option value="">Tất cả tòa nhà</option>
                @foreach($buildings as $building)
                <option value="{{ $building->id }}" {{ request('building_id') == $building->id ? 'selected' : '' }}>{{ $building->name }}</option>
                @endforeach
            </select>
        </div>
        <div>
            <label class="block text-sm font-semibold text-gray-700 mb-1 leading-5">Trạng thái</label>
            <select name="status" class="w-full px-4 py-2 bg-gray-50 border border-gray-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition appearance-none">
                <option value="">Tất cả trạng thái</option>
                <option value="empty" {{ request('status') == 'empty' ? 'selected' : '' }}>Trống</option>
                <option value="rented" {{ request('status') == 'rented' ? 'selected' : '' }}>Đang thuê</option>
                <option value="maintenance" {{ request('status') == 'maintenance' ? 'selected' : '' }}>Bảo trì</option>
            </select>
        </div>
        <div class="flex items-end space-x-2">
            <button type="submit" class="flex-1 bg-gray-900 text-white font-bold py-2 rounded-xl hover:bg-black transition text-sm">Lọc dữ liệu</button>
            <a href="{{ route('rooms.index') }}" class="px-4 py-2 bg-gray-100 text-gray-600 font-bold rounded-xl hover:bg-gray-200 transition text-sm flex items-center justify-center">
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
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">
                        <a href="{{ request()->fullUrlWithQuery(['sort' => 'room_number', 'order' => request('order') === 'asc' ? 'desc' : 'asc']) }}" class="flex items-center">
                            Số phòng
                            <i class="fas fa-sort ml-2 opacity-30"></i>
                        </a>
                    </th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Tòa nhà</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">
                        <a href="{{ request()->fullUrlWithQuery(['sort' => 'price', 'order' => request('order') === 'asc' ? 'desc' : 'asc']) }}" class="flex items-center">
                            Giá thuê
                            <i class="fas fa-sort ml-2 opacity-30"></i>
                        </a>
                    </th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider">Trạng thái</th>
                    <th class="px-6 py-4 text-xs font-bold text-gray-500 uppercase tracking-wider text-right">Hành động</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                @forelse($rooms as $room)
                <tr class="hover:bg-gray-50 transition group">
                    <td class="px-6 py-4 font-bold text-gray-900">{{ $room->room_number }}</td>
                    <td class="px-6 py-4 text-gray-600 text-sm">{{ $room->building->name }}</td>
                    <td class="px-6 py-4 font-bold text-indigo-600 text-sm">{{ number_format($room->price, 0, ',', '.') }} đ</td>
                    <td class="px-6 py-4">
                        @php
                            $statusMap = [
                                'empty' => ['label' => 'Còn trống', 'class' => 'text-green-600 bg-green-50'],
                                'rented' => ['label' => 'Đã thuê', 'class' => 'text-indigo-600 bg-indigo-50'],
                                'maintenance' => ['label' => 'Bảo trì', 'class' => 'text-orange-600 bg-orange-50'],
                            ];
                            $st = $statusMap[$room->status] ?? ['label' => $room->status, 'class' => 'text-gray-600 bg-gray-50'];
                        @endphp
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-tight {{ $st['class'] }}">
                            {{ $st['label'] }}
                        </span>
                    </td>
                    <td class="px-6 py-4 text-right space-x-2">
                        <a href="{{ route('rooms.edit', $room) }}" class="text-indigo-600 hover:bg-indigo-50 p-2 rounded-lg transition inline-block">
                            <i class="fas fa-edit"></i>
                        </a>
                        <form action="{{ route('rooms.destroy', $room) }}" method="POST" class="inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-500 hover:bg-red-50 p-2 rounded-lg transition" onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này?')">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="px-6 py-12 text-center text-gray-500 italic">Không tìm thấy dữ liệu phòng phù hợp.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if($rooms->hasPages())
    <div class="px-6 py-4 bg-gray-50 border-t border-gray-100">
        {{ $rooms->links() }}
    </div>
    @endif
</div>
@endsection
