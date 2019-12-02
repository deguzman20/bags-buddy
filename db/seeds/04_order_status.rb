# order status
OrderStatus.create!([
                      {
                        # id: 1,
                        name: "Pending"
                      },
                      {
                        # id: 3,
                        name: "Shipped"
                      },
                      {
                        # id: "2"
                        name: "Completed"
                      }
                    ])

pp "Order status Created"
