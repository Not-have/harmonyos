import { router } from '@kit.ArkUI'

@Entry
@Component
struct Router {
  build() {
    Column() {
      Text("list").onClick(() => {
        router.pushUrl({
          url: "pages/RouterDetail"
        })
      })
    }
  }
}