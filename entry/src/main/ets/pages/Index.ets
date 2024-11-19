import { mediaquery } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State col01Width: string = '20%';
  @State col02Width: string = '60%';
  @State col03Width: string = '20%';
  // 帮我们去监听屏幕
  smListener = mediaquery.matchMediaSync('screen and (width>=320vp) and (width<=600vp)')
  mdListener = mediaquery.matchMediaSync('screen and (width>=600vp) and (width<=840vp)')
  lgListener = mediaquery.matchMediaSync('screen and (width>=840vp)')

  // 组件的生命周期方法：组件即将显示 aboutToAppear
  aboutToAppear(): void {
    console.log("组件即将显示")
    this.smListener.on('change', (result) => {
      if (result.matches) {
        console.log('当匹配到 sm 屏')
      }
      this.col01Width = '100%';
      this.col02Width = '100%';
      this.col03Width = '100%';
    })

    this.mdListener.on('change', (result) => {
      if (result.matches) {
        console.log('当匹配到 md 屏')
        this.col01Width = '10%';
        this.col02Width = '80%';
        this.col03Width = '10%';
      }
    })

    this.lgListener.on('change', (result) => {
      if (result.matches) {
        console.log('当匹配到 lg 屏')
        this.col01Width = '20%';
        this.col02Width = '60%';
        this.col03Width = '20%';
      }
    })
  }

  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Column() {
        Text('左侧文本内容').backgroundColor(Color.Yellow).width(this.col01Width)
      }

      Column() {
        Text('中间文本内容').backgroundColor(Color.Gray).width(this.col02Width)
      }

      Column() {
        Text('右侧文本内容').backgroundColor(Color.Orange).width(this.col03Width)
      }
    }.width('100%')
  }
}