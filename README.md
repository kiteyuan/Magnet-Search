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

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=NzFjMzA0NDVmYTBkMGI4OTZlOTBlOGFmN2U3N2ZhNmFfbXhwQlByRGdTZ3B2d291NnZhN0NtWVFqNHZac0d1eUxfVG9rZW46UnFsOWIyNWYxb2hPNnh4SW5jZmNnYkJvbnJkXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=M2I0ODMzYzM0NDYyMDBjMWJkZTNmODI3ODRhNzI1NDNfc2VoNGJGYkhWNGxWV0llck0zMUF2bTFDMWxNZktpcDJfVG9rZW46WmEzN2JlSWRob1NtQWh4MWFRaGNDbXhNbndiXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

#### 二、磁力搜索

引擎规则配置完成后，即可进行资源搜索，除了搜索结果列表，工具还提供额外的预览和查看文件结构等附加功能。

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=N2E2M2Q2ZWVjZjFiNWMzMmRhNDE1YmUxMWE5OThjMzdfTjZQekgwM3BKT2l6TVlTQzhWRWhwTnV6N3VEbU1lazZfVG9rZW46UnBvVWJsYXc2b1RzbGR4Ym14cmNFNWwwbkViXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=YTlhOGUyN2Q4YzY3MDlhOGRlZWEwYzFmMDBlYzlmZmRfSjF1NG56RldTYW9ZSjlmUWZYVnF5WjFOZ0taSGxQNWVfVG9rZW46VXoxY2JkNVdvb3NFZzZ4OVBPM2N2UmhGbjNmXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=MDZjZTEyYjBjNDdiYmM3ZmJjNDY4OGYzOTRkMGFkZmZfYlA2NzJ0NEM5d01nSkFxTExWRlIzakp4VUQ5QW9kWGFfVG9rZW46UEtXVGI3bVN6b3VQcjN4b1lUU2N4cXZxbnJlXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=ZjA2ZTcwNDJhOTMwZDg5NTM5MzM4ZDMzNDlhMGFiNDdfTnJyWjlqbkxZSG9qdEg4STd3MnZNdk40RVBZVTMxc29fVG9rZW46RVNmeGJZVUZvb1Nodmh4d2ZTNWNMSm13bmhkXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

#### 三、磁力解析

用户可键入任意磁力链接，自动解析出相关预览图和文件结构信息。（移动端入口：底部菜单第三个功能页面）

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=YjA3Nzc1MTViZjRjNDFjYTczMWJhMTNjNDIwZTEzNjBfQXVrdEdOMnltcEltUmNkdXJieno4elczc0poSWVpbGJfVG9rZW46VDNsbmJ5N1dEbzI2bDR4RmtFcGNiZUVLbnlBXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

#### 四、我的收藏

账号登录状态下，用户可以将收藏合集进行外部分享链接/RSS订阅。

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=MzdkNDMzOTU5ZTNjYzc3NzNjN2RlZmRiODA2NmVlYjFfVEpiRTh3a3pXUUtRUWhRd1VEMklkRlp6cHdiRnJ3aGRfVG9rZW46T2ZhRmJDT0Rjb0VwTG14SmxaaGNnSzN6bmJjXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

#### 五、帖子广场

账号登录状态下，用户可以发布文章帖子。

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=MGVmOWNmNjdiYzFiMTVmNTI2YjY4ZGEwODQxMTE2ODNfQVdHVDFwQ3RoblJRbGNHaUZPN0VEY0NDcGhSTktGeWxfVG9rZW46UzNZTmI5d2Rhb3VqR3F4SHIxbGNCVFVYbmdFXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

#### 六、磁力转存

磁力转存的相关功能均在内测中，并且工具地址在【纸鸢下载】项目中（非纸鸢磁力），内测期间需要内测码。

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=Zjc1NmUwNGU3YzFjMjRlODE4ZTVkMGVlOTBjMmY3NTZfVzloNll2WDNFNlN6Y2J2TjZqVVhTT0tMaFRpT0dwVFhfVG9rZW46S3lyWGJOMVlvb1BWQ0d4NG1wR2NPcnc2bmZmXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)

![img](https://zi4fjhb0qmq.feishu.cn/space/api/box/stream/download/asynccode/?code=MzQ4Y2IyYTFkZTdjMmQzMzRmNWQ3ZTliMzhjOWM1MjRfUGxlQURyTXBPckdudzB5bVhRVGpkYUs0dDI3T1dHR25fVG9rZW46QzlhVWIyVEVNbzA5a3Z4Ykw1bGM1ZmFsbkxoXzE3ODA1NzQyMDk6MTc4MDU3NzgwOV9WNA)