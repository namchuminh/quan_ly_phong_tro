@extends('layouts.admin')

@section('title', 'Cấu hình Hệ thống')

@section('content')
<div class="mb-8 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
    <div>
        <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Cấu hình Hệ thống</h1>
        <p class="text-gray-500 mt-2 text-sm font-medium">Quản lý các tham số vận hành và thông tin thanh toán của hệ thống.</p>
    </div>
</div>

<div class="max-w-4xl">
    <form action="{{ route('settings.update') }}" method="POST" class="space-y-8">
        @csrf
        
        <!-- Bank Information -->
        <div class="bg-white rounded-[2.5rem] shadow-sm border border-gray-50 overflow-hidden">
            <div class="p-8 border-b border-gray-50 bg-gray-50/30 flex items-center justify-between">
                <div>
                    <h3 class="text-xs font-black text-gray-400 uppercase tracking-[0.2em] mb-1">Thông tin Thanh toán</h3>
                    <p class="text-xs text-gray-400 font-medium italic">Hiển thị trên hóa đơn của khách thuê</p>
                </div>
                <div class="w-12 h-12 bg-indigo-50 rounded-2xl flex items-center justify-center text-indigo-600">
                    <i class="fas fa-university text-xl"></i>
                </div>
            </div>
            <div class="p-8 space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Tên Ngân hàng</label>
                        <input type="text" name="settings[bank_name]" value="{{ $settings['bank_name'] }}" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition" placeholder="VD: Vietcombank, Techcombank...">
                    </div>
                    <div>
                        <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Chủ Tài khoản</label>
                        <input type="text" name="settings[bank_account_holder]" value="{{ $settings['bank_account_holder'] }}" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition" placeholder="VD: NGUYEN VAN A">
                    </div>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Số Tài khoản</label>
                    <input type="text" name="settings[bank_account_number]" value="{{ $settings['bank_account_number'] }}" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition" placeholder="VD: 0123456789">
                </div>
            </div>
        </div>

        <!-- General System info -->
        <div class="bg-white rounded-[2.5rem] shadow-sm border border-gray-50 overflow-hidden">
            <div class="p-8 border-b border-gray-50 bg-gray-50/30 flex items-center justify-between">
                <div>
                    <h3 class="text-xs font-black text-gray-400 uppercase tracking-[0.2em] mb-1">Thông tin Chung</h3>
                    <p class="text-xs text-gray-400 font-medium italic">Tên hệ thống và thông tin liên hệ</p>
                </div>
                <div class="w-12 h-12 bg-amber-50 rounded-2xl flex items-center justify-center text-amber-600">
                    <i class="fas fa-home text-xl"></i>
                </div>
            </div>
            <div class="p-8 space-y-6">
                <div>
                    <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Tên Hệ thống / Nhà trọ</label>
                    <input type="text" name="settings[system_name]" value="{{ $settings['system_name'] }}" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-gray-400 uppercase tracking-widest mb-3 pl-1">Số điện thoại Liên hệ</label>
                    <input type="text" name="settings[contact_phone]" value="{{ $settings['contact_phone'] }}" required class="w-full px-5 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:ring-2 focus:ring-indigo-500 outline-none text-sm font-bold text-gray-900 transition">
                </div>
            </div>
        </div>

        <div class="flex justify-end pt-6">
            <button type="submit" class="px-10 py-5 bg-gray-900 text-white font-black rounded-[2rem] hover:bg-black transition shadow-2xl shadow-gray-200 flex items-center gap-3">
                <i class="fas fa-save text-sm"></i>
                Lưu tất cả thay đổi
            </button>
        </div>
    </form>
</div>
@endsection
