<?php
namespace ITECH\Data\Lib;

class Constant
{
    const STATUS_CODE_SUCCESS = 200;
    const STATUS_CODE_ERROR = 400;
    const STATUS_CODE_ERROR_NOT_FOUND = 404;
    const STATUS_CODE_UNAUTHORIZED = 401;

    const USER_TYPE_ADMINISTRATOR = 1;
    const USER_TYPE_AGENT = 2;
    const USER_TYPE_MEMBER = 3;

    const USER_MEMBERSHIP_ADMIN_ADMIN = 11;
    const USER_MEMBERSHIP_ADMIN_EDITOR = 12;
    const USER_MEMBERSHIP_USER_AGENT = 21;
    const USER_MEMBERSHIP_USER_USER = 31;

    const USER_STATUS_ACTIVE = 1;
    const USER_STATUS_INACTIVE = 2;
    const USER_STATUS_REMOVED = 3;

    const USER_GENDER_MALE = 1;
    const USER_GENDER_FEMALE = 2;
    const USER_GENDER_UNDEFINED = 3;

    const USER_IS_VERIFIED_YES = 1;
    const USER_IS_VERIFIED_NOT = 2;

    const USER_AUTHENTICATE_APPLICATION_WEB = 1;
    const USER_AUTHENTICATE_APPLICATION_ANDROID = 2;
    const USER_AUTHENTICATE_APPLICATION_IOS = 3;
    const USER_AUTHENTICATE_APPLICATION_WINPHONE = 4;

    const SESSION_TOKEN_APPLICATION_WEB = 1;
    const SESSION_TOKEN_APPLICATION_ANDROID = 2;
    const SESSION_TOKEN_APPLICATION_IOS = 3;
    const SESSION_TOKEN_APPLICATION_WINPHONE = 4;

    const CATEGORY_STATUS_ACTIVE = 1;
    const CATEGORY_STATUS_INACTIVE = 2;
    const CATEGORY_STATUS_REMOVED = 3;

    const CATEGORY_MODULE_ARTICLE = 1;
    const CATEGORY_MODULE_FENGSHUI = 2;

    const ARTICLE_STATUS_ACTIVE = 1;
    const ARTICLE_STATUS_INACTIVE = 2;
    const ARTICLE_STATUS_REMOVED = 3;

    const ARTICLE_TYPE_DEFAULT = 1;
    const ARTICLE_TYPE_FOCUS = 2;

    const ARTICLE_TYPE_FENGSHUI_BOY = 10;
    const ARTICLE_TYPE_FENGSHUI_GIRL = 11;

    const ARTICLE_MODULE_POST = 1;
    const ARTICLE_MODULE_PAGE = 2;
    const ARTICLE_MODULE_FENGSHUI = 3;

    const PROJECT_STATUS_ACTIVE = 1;
    const PROJECT_STATUS_INACTIVE = 2;
    const PROJECT_STATUS_REMOVED = 3;

    const PROJECT_ATTRIBUTE_STATUS_ACTIVE = 1;
    const PROJECT_ATTRIBUTE_STATUS_INACTIVE = 2;
    const PROJECT_ATTRIBUTE_STATUS_REMOVED = 3;

    const PROJECT_ATTRIBUTE_TYPE_TYPE = 1;
    const PROJECT_ATTRIBUTE_TYPE_VIEW = 2;
    const PROJECT_ATTRIBUTE_TYPE_UTILITY = 3;

    const ATTRIBUTE_SEARCH_YES = 1;
    const ATTRIBUTE_SEARCH_NOT = 2;

    const ATTRIBUTE_STATUS_ACTIVE = 1;
    const ATTRIBUTE_STATUS_INACTIVE = 2;
    const ATTRIBUTE_STATUS_REMOVED = 3;

    const BLOCK_STATUS_ACTIVE = 1;
    const BLOCK_STATUS_INACTIVE = 2;
    const BLOCK_STATUS_REMOVED = 3;

    const BLOCK_ATTRIBUTE_TYPE_TYPE = 1;
    const BLOCK_ATTRIBUTE_TYPE_VIEW = 2;
    const BLOCK_ATTRIBUTE_TYPE_UTILITY = 3;

    const APARTMENT_STATUS_ACTIVE = 1;
    const APARTMENT_STATUS_INACTIVE = 2;
    const APARTMENT_STATUS_REMOVED = 3;

    const APARTMENT_CONDITION_AVAILABLE = 1;
    const APARTMENT_CONDITION_HOLD = 2;
    const APARTMENT_CONDITION_SOLD = 3;

    const APARTMENT_TYPE_BUY = 1;
    const APARTMENT_TYPE_RENT = 2;

    const MAP_IMAGE_TYPE_THUMBNAIL = 1;
    const MAP_IMAGE_TYPE_GALLERY = 2;
    const MAP_IMAGE_TYPE_FLOOR = 3;
    const MAP_IMAGE_TYPE_3D = 4;

    const APARTMENT_ATTRIBUTE_TYPE_ENTERTAINING_CONTROL_SYSTEM = 1;
    const APARTMENT_ATTRIBUTE_TYPE_ENERGY_CONTROL_SYSTEM = 2;
    const APARTMENT_ATTRIBUTE_TYPE_ENVIRONMENT_CONTROL_SYSTEM = 3;
    const APARTMENT_ATTRIBUTE_TYPE_SECURITY_CONTROL_SYSTEM = 4;
    const APARTMENT_ATTRIBUTE_TYPE_TYPE = 5;
    const APARTMENT_ATTRIBUTE_TYPE_VIEW = 6;
    const APARTMENT_ATTRIBUTE_TYPE_UTILITY = 7;
    const APARTMENT_ATTRIBUTE_TYPE_ROOM_TYPE = 8;
    const APARTMENT_ATTRIBUTE_TYPE_BEST_FOR = 9;
    const APARTMENT_ATTRIBUTE_TYPE_SUITABLE_FOR = 10;

    const CERITERIAL_STATUS_ACTIVE = 1;
    const CERITERIAL_STATUS_INACTIVE = 2;
    const CERITERIAL_STATUS_REMOVED = 3;

    const CERITERIAL_TYPE_BUY = 1;
    const CERITERIAL_TYPE_RENT = 2;
    const CERITERIAL_TYPE_SMART_SEARCH = 3;
    const CERITERIAL_APARTMENT_IS_NEW_YES = 1;
    const CERITERIAL_APARTMENT_IS_NEW_NOT = 2;
    const CERITERIAL_APARTMENT_IS_HOME_YES = 1;
    const CERITERIAL_APARTMENT_IS_HOME_NOT = 2;

    const TYPE_IMAGE_VIEW = 1;
    const TYPE_PLAN_VIEW = 2;
    const TYPE_BUILDING_VIEW = 3;
    const TYPE_LIST_APARTMENT_VIEW = 4;

    const TYPE_UPLOAD_IMAGE_PROJECT_DEFAULT = 1;
    const TYPE_UPLOAD_IMAGE_PROJECT_GALLERY= 2;
    const TYPE_UPLOAD_IMAGE_PROJECT_MAP_IMAGE = 3;
    const TYPE_UPLOAD_IMAGE_PROJECT_ATTRIBUTE = 4;
    const TYPE_UPLOAD_IMAGE_BLOCK_DEFAULT = 5;
    const TYPE_UPLOAD_IMAGE_BLOCK_GALLERY= 6;
    const TYPE_UPLOAD_IMAGE_BLOCK_MAP_IMAGE = 7;
    const TYPE_UPLOAD_IMAGE_BLOCK_ATTRIBUTE = 8;
    const TYPE_UPLOAD_IMAGE_APARTMENT_DEFAULT = 9;
    const TYPE_UPLOAD_IMAGE_APARTMENT_GALLERY= 10;
    const TYPE_UPLOAD_IMAGE_APARTMENT_ATTRIBUTE = 11;

    const MAP_IMAGE_MODULE_PROJECT = 1;
    const MAP_IMAGE_MODULE_BLOCK = 2;
    const MAP_IMAGE_MODULE_APARTMENT = 3;

    const ATTRIBUTE_MODULE_PROJECT = 1;
    const ATTRIBUTE_MODULE_BLOCK = 2;
    const ATTRIBUTE_MODULE_APARTMENT = 3;

    const ATTRIBUTE_TYPE_INPUT_SELECT = 'select';
    const ATTRIBUTE_TYPE_INPUT_TEXT = 'text';

    const ATTRIBUTE_TYPE_INT = 'int';
    const ATTRIBUTE_TYPE_VARCHAR = 'varchar';
    const ATTRIBUTE_TYPE_TIMESTAMP = 'timestamp';

    const USER_LOG_ADMINISTRATOR_LOGIN = 11;
    const USER_LOG_ADMINISTRATOR_CREATED_PROJECT = 12;
    const USER_LOG_ADMINISTRATOR_UPDATED_PROJECT = 13;
    const USER_LOG_ADMINISTRATOR_UPLOAD_IMAGE = 14;
    const USER_LOG_ADMINISTRATOR_DELETE_IMAGE = 15;
    const USER_LOG_ADMINISTRATOR_CREATED_BLOCK = 16;
    const USER_LOG_ADMINISTRATOR_UPDATED_BLOCK = 17;
    const USER_LOG_ADMINISTRATOR_CREATED_MAP_VIEW = 18;
    const USER_LOG_ADMINISTRATOR_UPDATED_MAP_VIEW = 19;
    const USER_LOG_TYPE_EDIT_USER = 16;
    const USER_LOG_TYPE_REMOVE_USER = 17;

    const USER_LOG_AGENT_LOGIN = 21;

    const USER_LOG_MEMBER_LOGIN = 31;

    const USER_LOG_TYPE_ADD_USER = 13;

    const MESSAGE_STATUS_UNREAD = 1;
    const MESSAGE_STATUS_READ = 2;

    const MESSAGE_STATUS_ACTIVE = 1;
    const MESSAGE_STATUS_INACTIVE = 2;
    const MESSAGE_STATUS_REMOVED = 3;

    const USER_SAVE_HOME = 1;
    const USER_SAVE_SEARCH = 2;

    const CATEGORY_SLIDE_HOME = 36;

    const SAVE_SEARCH_NOTIFY_DAILY = 1;
    const SAVE_SEARCH_NOTIFY_MONTHLY = 2;
    
    const TEXT_LANGUAGE_VIET = 'vi';
    const TEXT_LANGUAGE_ENG = 'eng';
    
    public static function checkLanguage(){
        $langCurrent = false;
        if (isset($_SESSION['LANGUAGE']) && !empty($_SESSION['LANGUAGE'])) {
            $langCurrent = $_SESSION['LANGUAGE'];
        }

        return $langCurrent;
    }

    public static function getProjectStatus()
    {
        return array(
            self::PROJECT_STATUS_ACTIVE => 'Active',
            self::PROJECT_STATUS_INACTIVE => 'Inactive',
            self::PROJECT_STATUS_REMOVED => 'Removed'
        );
    }

    public static function getProjectAttributeType()
    {
        return array(
            self::PROJECT_ATTRIBUTE_TYPE_TYPE => 'Kiểu',
            self::PROJECT_ATTRIBUTE_TYPE_VIEW => 'Hướng nhìn',
            self::PROJECT_ATTRIBUTE_TYPE_UTILITY => 'Tiện ích'
        );
    }

    public static function getBlockAttributeType()
    {
        return array(
            self::BLOCK_ATTRIBUTE_TYPE_TYPE => 'Kiểu',
            self::BLOCK_ATTRIBUTE_TYPE_VIEW => 'Hướng nhìn',
            self::BLOCK_ATTRIBUTE_TYPE_UTILITY => 'Tiện ích'
        );
    }

    public static function getApartmentAttributeType()
    {
        return array(
            self::APARTMENT_ATTRIBUTE_TYPE_TYPE => 'Kiểu căn hộ',
            self::APARTMENT_ATTRIBUTE_TYPE_VIEW => 'Môi trường sống',
            self::APARTMENT_ATTRIBUTE_TYPE_UTILITY => 'Dịch vụ - Tiện ích',
            /*
            self::APARTMENT_ATTRIBUTE_TYPE_ENTERTAINING_CONTROL_SYSTEM => 'Hệ thống giải trí âm nhạc',
            self::APARTMENT_ATTRIBUTE_TYPE_ENERGY_CONTROL_SYSTEM => 'Hệ thống điều khiển tiết kiệm điện',
            self::APARTMENT_ATTRIBUTE_TYPE_ENVIRONMENT_CONTROL_SYSTEM => 'Hệ thống kiểm soát môi trường',
            self::APARTMENT_ATTRIBUTE_TYPE_SECURITY_CONTROL_SYSTEM => 'Hệ thống an ninh',
            self::APARTMENT_ATTRIBUTE_TYPE_ROOM_TYPE => 'Phòng',
            self::APARTMENT_ATTRIBUTE_TYPE_BEST_FOR => 'Tốt nhất cho',
            self::APARTMENT_ATTRIBUTE_TYPE_SUITABLE_FOR => 'Phù hợp'
            */
        );
    }

    public static function getAttributeSearch()
    {
        return array(
            self::ATTRIBUTE_SEARCH_YES => 'Cho phép tìm kiếm',
            self::ATTRIBUTE_SEARCH_NOT => 'Không cho phép tìm kiếm'
        );
    }

    public static function getAttributeStatus()
    {
        return array(
            self::ATTRIBUTE_STATUS_ACTIVE => 'Active',
            self::ATTRIBUTE_STATUS_INACTIVE => 'Inactive',
            self::ATTRIBUTE_STATUS_REMOVED => 'Removed'
        );
    }

    public static function getBlockStatus()
    {
        return array(
            self::BLOCK_STATUS_ACTIVE => 'Active',
            self::BLOCK_STATUS_INACTIVE => 'Inactive',
            self::BLOCK_STATUS_REMOVED => 'Removed'
        );
    }

    public static function getApartmentStatus()
    {
        return array(
            self::BLOCK_STATUS_ACTIVE => 'Active',
            self::BLOCK_STATUS_INACTIVE => 'Inactive',
            self::BLOCK_STATUS_REMOVED => 'Removed'
        );
    }

    public static function getCeriterialTemplate()
    {
        return array(
            '1_big_4_small' => '1 lớn 4 nhỏ',
            '2_big_4_small' => '2 lớn 4 nhỏ',
            '1_big_5_small' => '1 lớn 5 nhỏ',
            '1_big_6_small' => '1 lớn 6 nhỏ'
        );
    }

    public static function getCeriterialTemplateValue()
    {
        return array(
            '1_big_4_small' => 5,
            '2_big_4_small' => 6,
            '1_big_5_small' => 7,
            '1_big_6_small' => 7
        );
    }

    public static function getMapView()
    {
        return array(
            self::TYPE_IMAGE_VIEW => 'Hình ảnh',
            self::TYPE_PLAN_VIEW => 'Bản đồ'
        );
    }

    public static function getUserGender()
    {
        return array(
            self::USER_GENDER_MALE => 'Nam',
            self::USER_GENDER_FEMALE => 'Nữ',
            self::USER_GENDER_UNDEFINED => 'Không xác định'
        );
    }

    public static function getUserStatus()
    {
        return array(
            self::USER_STATUS_ACTIVE => 'Active',
            self::USER_STATUS_INACTIVE => 'Inactive',
            self::USER_STATUS_REMOVED => 'Removed'
        );
    }

    public static function getUserMembership()
    {
        return array(
            self::USER_MEMBERSHIP_USER_USER => 'Thành viên'
        );
    }

    public static function getUserMembershipAdministrator()
    {
        return array(
            self::USER_MEMBERSHIP_ADMIN_ADMIN => 'Quản trị viên',
            self::USER_MEMBERSHIP_ADMIN_EDITOR => 'Quản trị nội dung'
        );
    }

    public static function getUserMembershipAgent()
    {
        return array(
            self::USER_MEMBERSHIP_USER_AGENT => 'Đại lý',
        );
    }

    public static function floorSelect()
    {
        $level = array('' => 'Chọn số tầng');
        for ($i = 1; $i <= 100; $i++) {
            if ($i > 0) {
                $level[$i] = $i;
            }
        }

        return $level;
    }

    public static function getApartmentCondition()
    {
        return array(
            self::APARTMENT_CONDITION_AVAILABLE => 'Còn trống',
            self::APARTMENT_CONDITION_HOLD => 'Đặt chỗ',
            self::APARTMENT_CONDITION_SOLD => 'Đã bán'
        );
    }

    public static function getApartmentConditionClass()
    {
        return array(
            self::APARTMENT_CONDITION_AVAILABLE => 'available',
            self::APARTMENT_CONDITION_HOLD => 'processing',
            self::APARTMENT_CONDITION_SOLD => 'sold'
        );
    }

    public static function getApartmentType()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                self::APARTMENT_TYPE_BUY => 'Buy',
                self::APARTMENT_TYPE_RENT => 'Rent'
            );
        } else {
            return array(
                self::APARTMENT_TYPE_BUY => 'Bán',
                self::APARTMENT_TYPE_RENT => 'Thuê'
            );
        }

    }

    public static function getTrend()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                1 => "Eastern",
                2 => "Southeast",
                3 => "South",
                4 => "Southwestern",
                5 => "Tay",
                6 => "Northwest",
                7 => "North",
                8 => "Northeast",
                9 => 'Northwest - Southwest',
                10 => 'Northeast - Northwest',
                11 => 'Northeast - Southeast',
                12 => 'Southeast - Southwest',
                13 => 'East-West',
                14 => 'Southeast - Northwest',
                15 => 'Northeast - Southwest'
            );
        } else {
            return array(
                1 => "Đông",
                2 => "Đông Nam",
                3 => "Nam",
                4 => "Tây Nam",
                5 => "Tây",
                6 => "Tây Bắc",
                7 => "Bắc",
                8 => "Đông Bắc",
                9 => 'Tây Bắc - Tây Nam',
                10 => 'Đông Bắc - Tây Bắc',
                11 => 'Đông Bắc - Đông Nam',
                12 => 'Đông Nam - Tây Nam',
                13 => 'Đông Tây',
                14 => 'Đông Nam - Tây Bắc',
                15 => 'Đông Bắc - Tây Nam'
            );
        }
    }

    public static function getProjectPropertyType()
    {
        return array(
            1  => "Căn hộ",
            2  => "Thông tầng",
            3  => "Căn hộ góc",
            4  => "Penthouse",
            5  => "Studio",
            6  => "Biệt thự",
            7  => "Biệt thự biển",
            8  => "Nhà mặt biển",
            9  => "Nhà biệt lập",
            10 => "Nhà liền kề",
            11 => "Officetel"
        );
    }

    public static function getProjectPropertyView()
    {
        return array(
            1  =>  "Biển",
            2  =>  "Sông",
            3  =>  "Hồ",
            4  =>  "Hồ bơi",
            5  =>  "Công viên",
            6  =>  "Vườn",
            7  =>  "Golf",
            8  =>  "Thành phố",
            9  =>  "Mặt trời mọc",
            10 => "Mặt trời lặn"
        );
    }

    public static function getProjectPropertyUtilitie()
    {
        return array(
            1  => "Spa",
            2  => "Gym",
            3  => "Hồ bơi",
            4  => "Công viên",
            5  => "Công viên nước",
            6  => "Sân chơi",
            7  => "Công viên giải trí",
            8  => "Nhà hàng",
            9  => "Siêu thị",
            10 => "Trung tâm mua sắm",
            11 => "Khu cho thú cưng",
            12 => "Sân golf",
            13 => "Sân tennis",
            14 => "Đường đi bộ",
            15 => "Dịch vụ dọn phòng",
            16 => "Dịch vụ bảo trì",
            17 => "Khu tiệc nướng ngoài trời",
            18 => "Nhà không có nội thất",
            19 => "Nhà có sẵn nội thất cơ bản",
            20 => "Nhà đầy đủ nội thất",
            21 => "Tiện ích khác"
        );
    }

    public static function getBlockPropertyType()
    {
        return array(
            1  => "Căn hộ",
            2  => "Thông tầng",
            3  => "Căn hộ góc",
            4  => "Penthouse",
            5  => "Studio",
            6  => "Biệt thự",
            7  => "Biệt thự biển",
            8  => "Nhà mặt biển",
            9  => "Nhà biệt lập",
            10 => "Nhà liền kề",
            11 => "Officetel"
        );
    }

    public static function getBlockPropertyView()
    {
        return array(
            1  =>  "Biển",
            2  =>  "Sông",
            3  =>  "Hồ",
            4  =>  "Hồ bơi",
            5  =>  "Công viên",
            6  =>  "Vườn",
            7  =>  "Golf",
            8  =>  "Thành phố",
            9  =>  "Mặt trời mọc",
            10 => "Mặt trời lặn"
        );
    }

    public static function getBlockPropertyUtilitie()
    {
        return array(
            1  => "Spa",
            2  => "Gym",
            3  => "Hồ bơi",
            4  => "Công viên",
            5  => "Công viên nước",
            6  => "Sân chơi",
            7  => "Công viên giải trí",
            8  => "Nhà hàng",
            9  => "Siêu thị",
            10 => "Trung tâm mua sắm",
            11 => "Khu cho thú cưng",
            12 => "Sân golf",
            13 => "Sân tennis",
            14 => "Đường đi bộ",
            15 => "Dịch vụ dọn phòng",
            16 => "Dịch vụ bảo trì",
            17 => "Khu tiệc nướng ngoài trời",
            18 => "Nhà không có nội thất",
            19 => "Nhà có sẵn nội thất cơ bản",
            20 => "Nhà đầy đủ nội thất",
            21 => "Tiện ích khác"
        );
    }

    public static function getPriceSearch()
    {
        return array(
            '' => 'Mức giá',
            1 => 'Nhỏ hơn 400.000.000 đ',
            2 => '400.000.000 đ - 600.000.000 đ',
            3 => '600.000.000 đ - 800.000.000 đ',
            4 => '800.000.000 đ - 1.000.000.000 đ',
            5 => '1.000.000.000 đ - 1.200.000.000 đ',
            6 => '1.200.000.000 đ - 1.400.000.000 đ',
            7 => '1.400.000.000 đ - 1.600.000.000 đ',
            8 => '1.600.000.000 đ - 1.800.000.000 đ',
            9 => '1.800.000.000 đ - 2.000.000.000 đ',
            10 => 'Lớn hơn 2.000.000.000 đ'
        );
    }

    public static function getPriceSearchValue()
    {
        return array(
            1 => 'NA-400000000',
            2 => '400000000-600000000',
            3 => '600000000-800000000',
            4 => '800000000-1000000000',
            5 => '1000000000-1200000000',
            6 => '1200000000-1400000000',
            7 => '1400000000-1600000000',
            8 => '1600000000-1800000000',
            9 => '1800000000-2000000000',
            10 => '2000000000-NA'
        );
    }

    public static function getSortByPrice()
    {

        if (self::checkLanguage() == 'eng') {
            return array(
                1 => 'Price low to high',
                2 => 'Price high to low'
            );
        } else {
            return array(
                1 => 'Giá thấp đến cao',
                2 => 'Giá cao xuống thấp'
            );
        }
    }

    public static function getChildrenSearch()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                '' => 'Children',
                1 => "1 children",
                2 => "2 children",
                3 => "3 children",
                4 => "4 children",
                5 => "5 children",
            );
        } else {
            return array(
                '' => 'Trẻ em',
                1 => "1 trẻ em",
                2 => "2 trẻ em",
                3 => "3 trẻ em",
                4 => "4 trẻ em",
                5 => "5 trẻ em",
            );
        }
    }

    public static function getAdultSearch()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                '' => 'Adult',
                1 => "1 adult",
                2 => "2 adult",
                3 => "3 adult",
                4 => "4 adult",
                5 => "5 adult",
            );
        } else {
            return array(
                '' => 'Người lớn',
                1 => "1 người lớn",
                2 => "2 người lớn",
                3 => "3 người lớn",
                4 => "4 người lớn",
                5 => "5 người lớn",
            );
        }
    }

    public static function getTypeSearch()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                '' => 'Any',
                self::APARTMENT_TYPE_BUY => 'Buy',
                self::APARTMENT_TYPE_RENT => 'Rent',
            );
        } else {
            return array(
                '' => 'Tất cả',
                self::APARTMENT_TYPE_BUY => 'Cần bán',
                self::APARTMENT_TYPE_RENT => 'Cho thuê',
            );
        }
    }

    public static function getMinRoomSearch()
    {
        if (self::checkLanguage() == 'eng') {
            return array(
                '' => 'Min Beds',
                1 => '1 Bedroom',
                2 => '2 Bedroom',
                3 => '3 Bedroom',
                4 => '4 Bedroom',
                5 => '5 Bedroom'
            );
        } else {
            return array(
                '' => 'Min Beds',
                1 => '1 phòng ngủ',
                2 => '2 phòng ngủ',
                3 => '3 phòng ngủ',
                4 => '4 phòng ngủ',
                5 => '5 phòng ngủ'
            );
        }
    }

    public static function getMaxRoomSearch()
    {
        if (self::checkLanguage() == 'eng'){
            return array(
                '' => 'Max Beds',
                1 => '1 Bedroom',
                2 => '2 Bedroom',
                3 => '3 Bedroom',
                4 => '4 Bedroom',
                5 => '5 Bedroom'
            );
        } else {
            return array(
                '' => 'Max Beds',
                1 => '1 phòng ngủ',
                2 => '2 phòng ngủ',
                3 => '3 phòng ngủ',
                4 => '4 phòng ngủ',
                5 => '5 phòng ngủ'
            );
        }
    }

    public static function textLanguage($key = '')
    {
        if (self::checkLanguage() == 'eng'){
            $out = array(
                'home' => 'Home',
                'project' => 'Project',
                'project_list' => 'Project list'
            );
        } else {
            $out = array(
                'home' => 'Trang chủ',
                'project' => 'Dự án',
                'project_list' => 'Danh sách dự án'
            );
        }

        return $out[$key];
    }

    public static function getArticleFengShuiType()
    {
        return array(
            self::ARTICLE_TYPE_FENGSHUI_BOY => 'Nam',
            self::ARTICLE_TYPE_FENGSHUI_GIRL => 'Nữ'
        );
    }
}
