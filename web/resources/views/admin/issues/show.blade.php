@extends('layouts.admin')

@section('title', 'Cập nhật Sự cố')

@section('content')
<div class="mb-8">
    <a href="{{ route('issues.index') }}" class="text-indigo-600 hover:text-indigo-800 flex items-center mb-4 transition">
        <i class="fas fa-arrow-left mr-2"></i>
        Quay lại danh sách
    </a>
    <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Chi tiết Sự cố #{{ $issue->id }}</h1>
</div>

<div class="max-w-3xl grid grid-cols-1 lg:grid-cols-2 gap-8">
    <div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100 space-y-6">
        <h3 class="text-xs font-black text-gray-400 uppercase tracking-widest border-b pb-4">Thông tin sự cố</h3>
        <div>
            <span class="text-[10px] font-bold text-indigo-500 uppercase block mb-1">Loại sự cố</span>
            <p class="text-lg font-black text-gray-900">{{ $issue->title }}</p>
        </div>
        <div>
            <span class="text-[10px] font-bold text-gray-400 uppercase block mb-1">Mô tả chi tiết</span>
            <p class="text-sm text-gray-600 leading-relaxed bg-gray-50 p-4 rounded-2xl italic">{{ $issue->description }}</p>
        </div>
        <div class="flex justify-between items-center pt-4 border-t border-gray-50">
            <span class="text-[10px] font-bold text-gray-400 uppercase">Phòng:</span>
            <span class="font-black text-gray-900 uppercase tracking-tight">Phòng {{ $issue->room->room_number }}</span>
        </div>
        <div class="flex justify-between items-center">
            <span class="text-[10px] font-bold text-gray-400 uppercase">Người báo:</span>
            <span class="font-black text-gray-900 uppercase tracking-tight">{{ $issue->user->name }}</span>
        </div>
    </div>

    <div class="bg-white p-8 rounded-[2.5rem] shadow-sm border border-gray-100">
        <h3 class="text-xs font-black text-gray-400 uppercase tracking-widest border-b pb-4 mb-6">Xử lý sự cố</h3>
        <form action="{{ route('issues.update', $issue) }}" method="POST" class="space-y-6">
            @csrf
            @method('PUT')
            <div>
                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Trạng thái xử lý</label>
                <select name="status" class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-700 transition appearance-none">
                    <option value="pending" {{ $issue->status == 'pending' ? 'selected' : '' }}>Chờ xử lý</option>
                    <option value="fixing" {{ $issue->status == 'fixing' ? 'selected' : '' }}>Đang sửa chữa</option>
                    <option value="resolved" {{ $issue->status == 'resolved' ? 'selected' : '' }}>Đã hoàn thành</option>
                </select>
            </div>
            <div>
                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Ghi chú của quản trị viên</label>
                <textarea name="admin_note" rows="4" class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm transition font-medium" placeholder="Cập nhật tiến độ xử lý...">{{ $issue->admin_note }}</textarea>
            </div>
            <button type="submit" class="w-full py-4 bg-gray-900 text-white font-bold rounded-2xl hover:bg-black transition shadow-xl shadow-gray-200">
                Lưu cập nhật
            </button>
        </form>
    </div>
</div>
@endsection
