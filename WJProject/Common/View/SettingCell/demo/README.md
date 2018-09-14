#  使用

类适配器 SomeModelAdapter 对应需要适配的SomeModel
每增加一个需要适配的model就写一个继承于CommonSettingCellAdapter的适配器。重写协议的方法。

// 拿到model
SomeModel * model = [[SomeModel alloc] init];

// 与输入建立联系
CommonSettingCellAdapter *modelAdapter = [[SomeModelAdapter alloc] initWithData : model];

// 与输出建立联系
[CommonSettingCell loadData:modelAdapter];



对象适配器  对应需要适配的多个model
在该类里面引入多个不同的model，根据model不同 返回不同的东西


