import { AbilityStage } from "@kit.AbilityKit";

export class DemoAbilityStage01 extends AbilityStage {
  onCreate(): void {
    console.log('创建')
  }
  onDestroy(): void {
    console.log('销毁')
  }
}
