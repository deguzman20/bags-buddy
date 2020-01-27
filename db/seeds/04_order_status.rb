# order status
OrderStatus.create!([
                      {
                        name: "Pending"
                      },
                      {
                        # down payment received
                        name: "Order Confirmed"
                      },
                      {
                        # Item ready to ship from US to PH
                        name: "Shipped"
                      },
                      {
                        # basta nandito na
                        # required to pay remaining balance
                        # depends on batch
                        name: "Item Arrived PH"
                      },
                      {
                        # item ship
                        # 1 day
                        # manual
                        name: "Ready to ship to local"
                      },
                      {
                        # manual
                        # 2 day
                        name: "Completed"
                      }
                    ])

pp "Order status Created"
