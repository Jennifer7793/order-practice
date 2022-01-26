#### Setup Project in Docker

1. 執行前需要先關閉本地mysql(3306 port)與rails server(port 3000)
2. 在本地專案目錄下: `$ docker-compose up`
3. 開啟localhost:3000，看得到網頁表示正常

#### 環境參數
1. 資料庫: integration_payment_system
1. 帳號密碼: root/qwer4321

#### docker相關
1. 進入docker容器：`docker-compose run app bash`，進去後就是正常的開發環境，可以執行`rails c`、`rails db:migrate`之類的指令
1. 關閉docker(在本地專案目錄下): docker-compose down

#### 考試題目

目標製作報表如下圖![存取款統計報表](./image.png)

1. order has two kind of service_type:
    1. deposit(代收): Order model, column `payment_type` IS NOT nil
    1. withdraw(代付): Order model, column `payment_type` IS nil
2. 欄位解。
    1. 日期：當周(4/1~4/7)，可以直接Order.all，資料庫內只有7天的資料。這個欄位可以直接hard code
    1. 第三方支付：顯示出ThirdPartyPayment的Name(加分題)，需要用到關聯，可以直接顯示third_party_payment_id
    1. 交易類型：將代收與代付分開統計，條件如上所示
    1. 總單數：該商戶當週代收 或 代付的總訂單數量
    1. 總成功單數：該商戶當都訂單狀態為paid(已支付)notified(已通知)
    1. 成功率：總成功單數/總單數
    1. 總手續費：成功訂單fee欄位總和
    1. 總金額：成功訂單amount總和
3. 製作一張相同的報表，不需要有上方的filter。不需要有任何的版面渲染，單純使用html table即可
4. 當計算印出內容在root path或任何路徑，不需要考慮登入狀態，這個考試主要考資料運算
5. Hint:
    1. ORM必定會使用到`.group`的方法
    2. 運算的方式有很多種，可以把資料找出來在用array的方法去算(建議方法)，或是直接下SQL方法把答案算出來(進階手段)