import { router } from '@kit.ArkUI'

@Entry
@Component
struct RouterDetail {
  build() {
    Column() {
      Button("返回").onClick(() =>{
        router.back();
      })
      Text("详情")
    }
  }
}