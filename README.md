纸鸢磁力是一款致力于用户极致搜索体验的磁力聚合工具，工具引擎通过自定义规则的磁力引擎搜索（均来自国内公网服务）清洗出最佳结果列表，同时提供磁力解析和文件预览图功能，为用户搜索时大大减少垃圾文件的转存风险。用户可自定义编写规则导入自用的引擎站点，纸鸢磁力从而负责并发搜索和返回，快速搜索全网海量资源。

> 纸鸢磁力只负责读取用户自定义的引擎站点并执行请求返回，不提供任何资源存储和查询服务，查询到的结果内容只取决于用户编写的自定义规则和站点数据，任何数据均不经过服务器。（工具内的任何服务均为公网已有服务二次封装而成）

工具地址：[纸鸢发布页地址](https://kiteyuan.info/) [网页版地址1](https://magnet.kiteyuan.info/) [网页版地址2](https://search.kiteyuan.info/) [纸鸢下载内测地址](https://mybt.kiteyuan.info/) APP版地址：关注微信公众号【纸鸢花的小屋】回复【纸鸢磁力】【纸鸢下载】【纸鸢下载内测码】关键词获取。

V 3.0.0：

- 新增【我的收藏】云同步功能，账号登录状态下可随时同步合集数据。
- 新增【我的收藏】合集分享/RSS订阅链接，其他用户可通过链接导入和订阅分享者合集。
- 新增【磁力规则】的若干条新引擎规则，修复已失效的规则模板。
- 新增【磁力解析】工具功能，用户可键入任意磁力链接，自动解析出相关预览图和文件结构信息。
- 测试开放【帖子广场】功能，账号登录状态下用户可发布文章内容。
- 优化工具前端交互体验和样式布局，修复已知前端问题。
- 移除AI搜索和向量化检索相关功能，相关功能已迁移至后续的【纸鸢Agent】项目。

V 2.1.2：

- 底层逻辑全部采用Golang重构，在高并发场景下的性能发挥更强。
- 前端UI布局优化，遵循Material Design 3设计规范，交互和视觉体验更加舒适。
- 新增Github账号登录功能，在后续账号体系下能够提供更加专业化的功能服务。
- 新增DHT爬虫和Tracker服务，以此确保磁力文件信息的实时性和可用性。
- 新增RAG工作流和AI搜索功能，将用户需求向量化做混合检索，最后配合LLM做问答输出。
- 爬虫支持POST请求规则的数据爬取，以此兼容和适配更多的磁力搜索引擎规则。

#### 一、磁力规则

首次使用工具需要配置规则，可手动导入和云导入，导入成功后即可开始搜索（移动端入口：【个人】-【我的规则】）。用户可借助Claude Code、Codex、Cursor等相关AI编程工具编写自定义规则，相关的Skill和规则示例模板地址：[配置自定义规则教程和Agent Skill文档](https://github.com/kiteyuan/Magnet-Search)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMmaiGug2diUP_tveAc8icC61qC080AAkgMaxuolBBFumDocCd_SD0BAAMCAAN3AAM7BA.png)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMnaiGu3Hs3bAABlzxq-ykJkH6rNxT3AAJJDGsbqJQQRVchJRZwoZmEAQADAgADdwADOwQ.png)

#### 二、磁力搜索

引擎规则配置完成后，即可进行资源搜索，除了搜索结果列表，工具还提供额外的预览和查看文件结构等附加功能。

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMoaiGu8XxYhKHaN0dPwckVbr5kTNsAAksMaxuolBBFCirXLhBCmNUBAAMCAAN3AAM7BA.png)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMpaiGvBKfSbrCh6LI2VAJMfJZYIq0AAkwMaxuolBBFIAww6knDDq8BAAMCAAN3AAM7BA.png)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMqaiGvGehFEiX8X_xOuYW6XH2hOcoAAk0MaxuolBBFhBG2EhXdkvIBAAMCAAN3AAM7BA.png)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMraiGvLDLJUhAh6elRb7qFbeCwSwADTwxrG6iUEEUGsjoJZgT5TwEAAwIAA3cAAzsE.png)

#### 三、磁力解析

用户可键入任意磁力链接，自动解析出相关预览图和文件结构信息。（移动端入口：底部菜单第三个功能页面）

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMsaiGvRKDhuKxCWtXVI2XL_FG8rQ0AAlAMaxuolBBFdh5-KrhnrGMBAAMCAAN3AAM7BA.png)

#### 四、我的收藏

账号登录状态下，用户可以将收藏合集进行外部分享链接/RSS订阅。

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMtaiGvVyW_wYFGt29POyhGfvhTHNAAAlEMaxuolBBFMQSb0WcuAaABAAMCAAN3AAM7BA.png)

#### 五、帖子广场

账号登录状态下，用户可以发布文章帖子。

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMuaiGvaLqbLUn5xz6H8QQedNm0z4cAAlIMaxuolBBFU3TF8TWYjucBAAMCAAN3AAM7BA.png)

#### 六、磁力转存

磁力转存的相关功能均在内测中，并且工具地址在【纸鸢下载】项目中（非纸鸢磁力），内测期间需要内测码。

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMvaiGveUkDQfjCyISNDm0HuxNmNhkAAlMMaxuolBBFyli6wewHUeEBAAMCAAN3AAM7BA.png)

![img](https://image.kiteyuan.info/file/AgACAgEAAyEGAATsZPTZAAMwaiGvh9T1R_yfKZi0PXQlYxvmBcQAAlQMaxuolBBFeCClWV44wkEBAAMCAAN3AAM7BA.png)