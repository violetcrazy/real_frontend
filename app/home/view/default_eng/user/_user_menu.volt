<li>
    <a class="{{ userAction == 'profile' ? 'active' : '' }}" href="{{ url({'for' : 'user_profile'}) }}">
        Basic Info
    </a>
</li>
<li>
    <a class="{{ userAction == 'purchasedProperties' ? 'active' : '' }}" href="{{ url({'for' : 'user_purchased_properties'}) }}">
        Purchased Properties
    </a>
</li>
<li>
    <a class="{{ userAction == 'saveHome' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_home'}) }}">
        Saved Homes
    </a>
</li>
<li>
    <a class="{{ userAction == 'saveSearch' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_search'}) }}">
        Saved Searchs
    </a>
</li>
<li>
    <a class="{{ userAction == 'message' ? 'active' : '' }}" href="{{ url({'for' : 'user_message'}) }}">
        Messages
    </a>
</li>
<li>
    <a class="{{ userAction == 'contact' ? 'active' : '' }}" href="{{ url({'for' : 'user_contact'}) }}">
        Contact customer
    </a>
</li>
<li>
    <a class="{{ userAction == 'edit' ? 'active' : '' }}" href="{{ url({'for' : 'user_edit'}) }}">
        Settings
    </a>
</li>
