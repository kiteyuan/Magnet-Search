# regulars.json 规则结构说明与 AI 自动生成指南

本文档用于让任意 AI 在拿到“一个搜索链接（或 curl）”后，能自动请求页面、分析结构、编写并验证可用规则。

如果只想快速新增一个引擎，优先看：

- “最小可用模板”
- “stepConfig 结构”
- “常见失败与修复”

说明：

- 本文档是规则规范说明
- `exmple_rule_20260604.json` 是更接近真实落地的参考样例
- 新增规则时，字段组织建议以样例为准，字段含义以本文档为准

## 1. 文件作用与顶层结构

规则文件路径：`migrate-backup/regulars.json`

顶层结构：

```json
{
  "configName": "通用规则",
  "configVersion": "1.0.0",
  "regulars": [
    {
      "engineName": "...",
      "engineUrl": "...",
      "isExternalEngine": false,
      "defaultSort": "...",
      "RequestMethod": "GET",
      "DefaultPage": 1,
      "engineStatus": "enable",
      "sortList": [...],
      "stepConfig": {...}
    }
  ]
}
```

`regulars` 数组中的每一项就是一个搜索引擎规则。

## 1.1 最小可用模板

下面这个模板适合直接复制后改字段，保留了新增一个引擎通常必须具备的最小结构：

```json
{
  "configName": "通用规则",
  "configVersion": "1.0.0",
  "regulars": [
    {
      "engineName": "示例引擎",
      "engineUrl": "https://example.com",
      "engineTags": ["general"],
      "isExternalEngine": false,
      "defaultSort": "default",
      "RequestMethod": "GET",
      "DefaultPage": 1,
      "engineStatus": "enable",
      "sortList": [
        {
          "sortName": "默认",
          "sortKey": "default",
          "sortUrl": "/search?q=%SearchKey%&page=%Page%"
        }
      ],
      "stepConfig": {
        "request": {
          "method": "GET",
          "url": "/search?q=%SearchKey%&page=%Page%",
          "headers": {}
        },
        "parser": {
          "responseType": "html",
          "listPointer": ".result-item",
          "itemFields": {
            "title": { "src": "h3>a", "action": "text" },
            "detailLink": { "src": "h3>a", "action": "attr:href" },
            "magnet": { "src": "a[href^='magnet:?']", "action": "attr:href" }
          }
        },
        "navigation": {
          "pageStart": 1,
          "sorts": [
            { "name": "default", "url": "/search?q=%SearchKey%&page=%Page%" }
          ]
        }
      }
    }
  ]
}
```

如果列表页没有磁链，则把 `magnet` 从首跳 `itemFields` 中移除，并增加 `parser.nextStep` 到详情页提取。

## 2. 引擎级字段含义

- `engineName`：引擎名，需唯一
- `engineUrl`：站点根地址（协议 + 域名）
- `engineTags`：引擎分类标签，样例中已使用，建议保留，如 `["general"]`、`["anime"]`
- `isExternalEngine`：是否外部跳转引擎（通常 `false`）
- `defaultSort`：默认排序 key（需与 `sortList[].sortKey` 对应）
- `RequestMethod`：历史字段，常见 `GET`
- `DefaultPage`：默认页码，通常 `1`
- `engineStatus`：`enable`/`disable`
- `sortList`：前端可选排序项
- `stepConfig`：核心抓取规则（服务端执行）

## 3. sortList 结构

示例：

```json
"sortList": [
  {
    "sortName": "相关程度",
    "sortKey": "rel",
    "sortUrl": "/search-%SearchKey%-0-0-%Page%.html"
  }
]
```

- `sortName`：展示给用户
- `sortKey`：程序排序标识
- `sortUrl`：该排序对应 URL 模板

占位符约定：

- `%SearchKey%`：搜索词（编码后）
- `%Page%`：页码
- `%Offset%`：偏移量（部分接口使用）

## 4. stepConfig 结构

```json
"stepConfig": {
  "request": {
    "method": "GET",
    "url": "/search-%SearchKey%-0-0-%Page%.html",
    "headers": {},
    "payloadType": "json",
    "payloadTemplate": "{\"q\":\"%SearchKey%\"}"
  },
  "parser": {
    "responseType": "html",
    "listPointer": "div.result-item",
    "itemFields": {
      "title": { "src": "h3>a", "action": "text" },
      "detailLink": { "src": "h3>a", "action": "attr:href" },
      "magnet": { "src": "a[href^='magnet:?']", "action": "attr:href" }
    },
    "nextStep": {}
  },
  "navigation": {
    "pageStart": 1,
    "pageSize": 20,
    "sorts": [
      { "name": "rel", "url": "/search-%SearchKey%-0-0-%Page%.html" }
    ]
  }
}
```

### 4.1 request

- `method`：`GET`/`POST`
- `url`：请求路径或完整 URL
- `headers`：请求头，可按 curl 转换
- `payloadType`：常见 `json`，通常仅 `POST` 时需要
- `payloadTemplate`：请求体模板，可含占位符；`GET` 场景通常可省略

### 4.2 parser

- `responseType`：`html` 或 `json`
- `listPointer`：
  - HTML：CSS 选择器，表示“结果列表项”的选择范围
  - JSON：列表路径，如 `data`、`result.list`
- `itemFields`：字段抽取映射
- `nextStep`：需要二跳详情页时配置

### 4.3 itemFields 字段

每个字段结构：

```json
"fieldName": {
  "src": "选择器或JSON路径",
  "action": "text|attr:*|value",
  "template": "可选，格式化模板"
}
```

常用字段名（建议保持一致）：

- `title`：标题
- `detailLink`：详情页链接
- `magnet`：磁力链接
- `size`：大小
- `date`：日期
- `description`：描述

`action` 说明：

- `text`：提取文本（HTML）
- `attr:*`：提取指定属性（HTML），常见如 `attr:href`、`attr:value`、`attr:title`
- `value`：取 JSON 字段值（JSON 响应）

`template` 说明：

- 当站点只返回 hash 时可拼接：
  - `magnet:?xt=urn:btih:%value%`
- 详情页链接也可拼接：
  - `https://example.com/detail/%value%`

### 4.4 nextStep（二跳规则）

当列表页拿不到磁链、需要进入详情页时使用：

```json
"nextStep": {
  "request": {
    "method": "GET",
    "url": "%detailLink%"
  },
  "parser": {
    "responseType": "html",
    "itemFields": {
      "magnet": {
        "src": "#download",
        "action": "attr:href"
      }
    }
  },
  "navigation": {
    "pageStart": 1,
    "sorts": []
  }
}
```

使用场景：

- 列表页拿不到磁链，只能先取 `detailLink`
- 详情页中的磁链不在 `href`，而是在 `value`、`title` 等属性里
- 列表页字段不全，需要补充 `size`、`date`、`description`

## 5. navigation 结构

- `pageStart`：起始页（通常 1）
- `pageSize`：可选，用于偏移计算型接口
- `sorts[].name`：与 `sortList[].sortKey` 对应
- `sorts[].url`：该排序实际请求 URL

若 `request.url` 为空，程序会按 `sorts` 和当前排序选择 URL。

建议：

- `sortList` 给前端展示
- `navigation.sorts` 给抓取逻辑使用
- 两者的排序 key 必须一一对应
- `defaultSort` 必须命中 `sortList[].sortKey`

## 6. 规则执行关键行为（实现层）

由 `server/internal/utils/spider.go` 执行，关键行为如下：

- 变量替换：会替换 `%变量名%`，并对 `%SearchKey%` 做编码安全处理
- URL 拼接：相对链接会自动拼到 `engineUrl` 基础域名
- HTML 抽取：`attr:href` 会自动转绝对 URL
- JSON 抽取：支持路径读取 + `template` 二次格式化
- 二跳执行：`nextStep` 在每条列表项上单独执行并与首跳结果合并
- 结果过滤：最终至少要有标题，且 `magnet` 或 `link` 有一个可用

## 7. AI 自动生成规则的标准流程

### 步骤 1：输入

最少输入之一：

- 搜索页 URL（例如 `https://site/search-关键词-1.html`）
- 或用户提供的完整 curl

### 步骤 2：自动请求与结构分析

1. 请求搜索页（优先复用 curl 头部）
2. 判断响应类型：
   - HTML：定位每条结果的公共外层块（listPointer）
   - JSON：找到结果数组路径（listPointer）
3. 在单条结果内确认字段来源：
   - 标题、详情链接、磁链、大小、时间、描述
4. 判断是否需要 `nextStep`：
   - 列表页无磁链时，转详情页提取

### 步骤 3：生成排序与分页

1. 从页面 URL 规律提取分页参数
2. 从站点可见排序入口提取 sortUrl
3. 填充 `sortList` 与 `navigation.sorts`
4. `defaultSort` 必须命中其中一个 `sortKey`

### 步骤 4：落盘到 regulars.json

1. 新增一个完整引擎对象到 `regulars` 数组
2. `engineName` 不与现有冲突
3. URL、选择器、字段名统一规范

### 步骤 5：回归验证（必须）

至少验证三项：

1. 规则可被 JSON 正常解析
2. 不同关键词返回的 `title/magnet` 数量稳定
3. 翻页（page=1,2）仍可解析出有效结果

建议记录验证统计：

- `items=xx`
- `title=xx`
- `magnet=xx`
- `date=xx`
- `size=xx`

## 8. 快速模板（可直接复制给 AI）

```text
请在 migrate-backup/regulars.json 新增引擎规则，要求：
1) 用我提供的 URL/curl 自动请求页面；
2) 自动分析 listPointer、itemFields、分页和排序；
3) 若列表无磁链，自动配置 nextStep 进详情页取 magnet；
4) 按现有字段命名规范生成完整 stepConfig；
5) 写入后自动做回归验证，输出 items/title/magnet/date/size 统计。
```

## 9. 常见失败与修复

- 结果为 0：
  - `listPointer` 过窄/过宽，或页面需不同 headers
- 磁链为空：
  - 站点仅在详情页提供磁链，需配置 `nextStep`
- 属性提取失败：
  - 不一定是 `href`，有些站点把磁链放在 `value` 或 `title`，应改用 `attr:value`、`attr:title`
- 链接是相对路径：
  - 使用 `attr:href`，程序会自动拼接绝对 URL
- JSON POST 失败：
  - 校验 `payloadTemplate` 是否是合法 JSON
- 排序无效：
  - `sortList.sortKey` 与 `navigation.sorts.name` 不一致

## 10. 编写规则时的推荐约定

- 能直接拿磁链就不要上 `nextStep`，减少请求量
- 标题字段尽量稳定，避免取到带大量附加文本的整块容器
- `description` 不是必填，但建议保留，便于前端展示
- `headers` 不必无脑复制全部浏览器头，优先保留 `user-agent`、`referer`、`content-type`、`accept`
- JSON 接口优先使用 `value + template`，不要把拼接逻辑写死到外层
- 分页如果是偏移量接口，优先使用 `%Offset%` 并补上 `navigation.pageSize`
