function doSomething()
{
}
MENU = new ContextMenu();
MENU.hideBuiltInItems();
Functioned = new ContextMenuItem("The Unofficial Turn Processor for Space Alert.",doSomething);
MENU.customItems.push(Functioned);
_root.menu = MENU;
