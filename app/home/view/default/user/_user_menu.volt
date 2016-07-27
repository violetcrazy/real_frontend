<li>
    <a class="{{ userAction == 'profile' ? 'active' : '' }}" href="{{ url({'for' : 'user_profile'}) }}">
        Thông tin cá nhân
    </a>
</li>
<li>
    <a class="{{ userAction == 'purchasedProperties' ? 'active' : '' }}" href="{{ url({'for' : 'user_purchased_properties'}) }}">
        Căn hộ đã mua
    </a>
</li>
<li>
    <a class="{{ userAction == 'saveHome' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_home'}) }}">
        Căn hộ đã lưu
    </a>
</li>
<li>
    <a class="{{ userAction == 'saveSearch' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_search'}) }}">
        Kết quả tìm kiếm đã lưu
    </a>
</li>
<li>
    <a class="{{ userAction == 'contact' ? 'active' : '' }}" href="{{ url({'for' : 'user_contact'}) }}">
        Danh bạ
    </a>
</li>
<li>
    <a class="{{ userAction == 'message' ? 'active' : '' }}" href="{{ url({'for' : 'user_message'}) }}">
        Tin nhắn
    </a>
</li>
<li>
    <a class="{{ userAction == 'edit' ? 'active' : '' }}" href="{{ url({'for' : 'user_edit'}) }}">
        Cài đặt
    </a>
</li>
