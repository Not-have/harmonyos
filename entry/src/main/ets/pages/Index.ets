
@Entry
@Component
struct UiAbility {

  aboutToAppear(): void {
    console.log("aboutToAppear")

  }
  onPageShow(): void {
    console.log("onPageShow")
  }
  build() {
    Column() {
      Text("list")
    }
  }
}
