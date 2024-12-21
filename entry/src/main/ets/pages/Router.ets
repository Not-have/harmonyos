import { router } from '@kit.ArkUI'

@Entry
@Component
struct Router {
  @State arr: string[] = ["哈哈哈", "呵呵呵", "啊啊啊"]

  build() {
    Column() {
      Text("list")

      ForEach(this.arr, (item: string) => {
        Button(`${item}`)
      })

      Button("router.pushUrl 保留当前页面跳转，是可以返回的").onClick(() => {
        router.pushUrl({
          url: "pages/RouterDetail",
          params: {
            id: "test"
          }
        }, router.RouterMode.Single) // 单例模式

      })


      Button("router.replaceUrl 销毁当前页面跳转").onClick(() => {
        router.replaceUrl({
          url: "pages/RouterDetail",
          params: {
            id: "test"
          }
        })
      })
    }
  }
}
