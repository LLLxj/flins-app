class Config{
  static const String DEV_BASE_URL = 'http://mp.flins.com.cn';
  static const String UAT_BASE_URL = 'https://api.flins.com.cn';
  static const String PROD_BASE_URL = 'https://www.scohmed.com';
  static String baseUrl = DEV_BASE_URL;
  static setApiurl (index) {
    switch (index) {
      case 1: // 测试环境
        baseUrl = DEV_BASE_URL;
        return baseUrl;
        break;
      case 2: // 预生产环境
        baseUrl = UAT_BASE_URL;
        return baseUrl;
        break;
      case 3: // 生产环境
        baseUrl = PROD_BASE_URL;
        return baseUrl;
        break;
      default: 
        baseUrl = DEV_BASE_URL;
    }
  }

  static getApiurl () {
    return baseUrl;
  }
}

