import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct UiAbility {

  aboutToAppear(): void {
    console.log("aboutToAppear")

  }
  onPageShow(): void {
    console.log("onPageShow")
  }

  private context = getContext(this) as common.UIAbilityContext;
  //
  eventHubFunc(): void {
    // 带1个参数触发自定义“event1”事件
    this.context.eventHub.emit('event1', "1");
    this.context.eventHub.emit('event1', "2");
  }


  build() {
    Column() {
      Text("list").onClick(() => {
        promptAction.showToast({
          message: 'EventHubFuncA'
        });
      })
      Button("按钮").onClick(() => this.eventHubFunc())
    }
  }
}
