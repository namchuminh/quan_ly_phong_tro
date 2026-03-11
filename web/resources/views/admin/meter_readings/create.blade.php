@extends('layouts.admin')

@section('title', 'Ghi Chỉ số mới')

@section('content')
<div class="mb-8">
    <a href="{{ route('meter-readings.index') }}" class="text-indigo-600 hover:text-indigo-800 flex items-center mb-4 transition">
        <i class="fas fa-arrow-left mr-2"></i>
        Quay lại danh sách
    </a>
    <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Ghi Chỉ số Điện & Nước</h1>
</div>

<div class="max-w-2xl bg-white p-10 rounded-[2.5rem] shadow-sm border border-gray-100">
    <form action="{{ route('meter-readings.store') }}" method="POST" class="space-y-6">
        @csrf
        <div>
            <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Chọn phòng</label>
            <select name="room_id" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-700 transition appearance-none">
                <option value="">Chọn một phòng</option>
                @foreach($rooms as $room)
                <option value="{{ $room->id }}">Phòng {{ $room->room_number }} ({{ $room->building->name }})</option>
                @endforeach
            </select>
        </div>
        <div class="grid grid-cols-2 gap-6">
            <div>
                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Loại chỉ số</label>
                <select name="type" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-700 transition appearance-none">
                    <option value="electricity">Điện (kWh)</option>
                    <option value="water">Nước (m³)</option>
                </select>
            </div>
            <div>
                <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Ngày ghi nhận</label>
                <input type="date" name="read_date" required value="{{ date('Y-m-d') }}" class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition">
            </div>
        </div>
        <div>
            <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Chỉ số mới</label>
            <input type="number" name="new_value" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-base font-black text-gray-900 transition" placeholder="VD: 1250">
            <p class="text-[10px] text-gray-400 font-medium italic mt-2 pl-1">* Hệ thống sẽ tự động tính toán dựa trên chỉ số cũ gần nhất.</p>
        </div>
        <div class="pt-6">
            <button type="submit" class="w-full py-4 bg-indigo-600 text-white font-bold rounded-2xl hover:bg-indigo-700 transition shadow-xl shadow-indigo-100">
                Ghi và lưu chỉ số
            </button>
        </div>
    </form>
</div>
@endsection
