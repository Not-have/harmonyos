import { router } from '@kit.ArkUI'

interface IRouterParams{
  id: string
}
@Entry
@Component
struct RouterDetail {

  // 接受参数
  @State str: string = "";

  // 页面即将显示时，获取上个页面数据
  aboutToAppear(): void {
    this.str = (router.getParams() as IRouterParams).id
  }
  build() {
    Column() {
      Button("返回").onClick(() =>{
        // router.back();
        // 销毁后也是不可跳转的，他必须要存在与页面站内，才可以跳转
        router.back({
          url: "pages/Router"
        })
      })
      Text("详情" + this.str)
    }
  }
}
