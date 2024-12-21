

interface IObj {
  name: string,
  age: number
}

@Entry
@Component
struct Ui {
  @Builder
  Components() {
    Text("组件")
  }

  @State x: number = 40;
  @State y: number = -30;
  @State num: number = 0
  @State @Watch('transformTime') now: number = Date.now()
  @State obj: IObj = { name: '李思思', age: 18 }

  transformTime() {
    console.log(`${this.now} 监听变化`)
  }

  @State str: string = ""
  @State isAgree: boolean = false
  @State arr: string[] = ["哈哈哈", "呵呵呵", "啊啊啊"]

  build() {
    Column() {
      Image($rawfile('01.jpg')).width(200).borderWidth(1).translate({ x: this.x, y: this.y })// onTouch 有三个阶段
        .onTouch(event => {
          if (event.type === TouchType.Down) {
            console.log('开始触摸');
          }

          if (event.type === TouchType.Move) {
            console.log('移动触摸', event.touches[0].x, event.touches[0].y);
            this.x = event.touches[0].x;
            this.y = event.touches[0].y;
          }

          if (event.type === TouchType.Up) {
            console.log('结束触摸');
          }
        })
      Divider().margin({ bottom: 10 })
      TextInput().borderWidth(1)
      Divider().margin({ bottom: 10 })
      Row() {
        Button('+ 1').onClick(() => this.num = this.num + 1)
        Text(`${this.num}`)
      }

      Divider()
      this.Components()
      Divider()
      Text("数据监听")
      Text(`当前系统时间: ${this.now} `).onClick(() => {
        this.now = Date.now()
      })

      Divider()
      Text('对象')
      Text(`${this.obj.age}`).onClick(() => {
        this.obj.age = this.obj.age + 1
      })

      Divider()
      Text('输入框' + this.str)
      // $$this.str 就是双向绑定
      TextInput({
        placeholder: '请输入',
        text: $$this.str
      })
      Divider()
      Text('用户勾选')
      Checkbox().select($$this.isAgree)
      Text("用户是否同意")
      Text(`${this.isAgree ? 'Yes' : 'No'}`)
      Divider()
      Text('循环渲染')
      ForEach(this.arr, (item: string) => {
        Button(`${item}`)
      }, (item: string, index: number) => {
        return item + index
      })
    }
  }
}