# Field of Dream

## notice

- [X] Make sure to use object numbers in the range 99120 – 99129 for all of the objects.

## table

- 贊助者（Sponsor）資料表 (99120)

        Sponsor Number：贊助者編號（每個贊助者需有唯一編號）

        Sponsor's Name：贊助者名稱（每個單字的首字母需大寫）

        Sponsor's Address：至少兩行地址

        Active Status：是否為活躍贊助者（預設大多數為活躍）

        Join Date：加入日期（不可清空已填入的日期）

        Sponsorship Level：贊助級別（Rookie、Major League、All-Star、Hall-of-Fame）

        Sponsor Team：主要贊助的球隊（每個贊助者主要支持一支球隊）

        Marital Status：婚姻狀況（Single、Married、Divorced、Widowed、Other）

        Number of Children：子女數量

- 贊助承諾（Pledge）資料表 (99122)

        Line No.：行號（用於識別每筆承諾）

        Sponsor No.：贊助者編號

        Pledge Date：承諾日期

        Pledge Amount：承諾金額（最低 $25.00）

- 贊助捐款（Contribution）資料表 (99123)

        Line No.：行號（用於識別每筆捐款）

        Sponsor No.：贊助者編號

        Description：簡短描述

        Contribution Date：捐款日期

        Contribution Amount：捐款金額

- 球隊（Team）資料表 (99121)

        Code：球隊代碼（簡短名稱）

        Team Name：球隊名稱（例如 Marlins, Cubs）

        Team Colors：球隊顏色

        Manager Code：經理代碼（來自 Salesperson/Purchaser 表）

        Manager Name：經理名稱（FlowField）

        Activated Status：啟用/停用狀態

## Page

## report
