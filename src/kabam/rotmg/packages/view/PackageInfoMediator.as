package kabam.rotmg.packages.view {
import kabam.rotmg.dialogs.control.CloseDialogsSignal;

import robotlegs.bender.bundles.mvcs.Mediator;
//import kabam.rotmg.dialogs.control.OpenDialogSignal;
//import kabam.rotmg.dailyLogin.signal.ShowDailyCalendarPopupSignal;

public class PackageInfoMediator extends Mediator {

    [Inject]
    public var view:PackageInfoDialog;
    [Inject]
    public var closeDialogs:CloseDialogsSignal;
    //[Inject]
    //public var openDialog:OpenDialogSignal;
    //[Inject]
    //public var showDailyCalendarSignal:ShowDailyCalendarPopupSignal;


    override public function initialize():void {
        this.view.closed.add(this.onClosed);
    }

    override public function destroy():void {
        this.view.closed.remove(this.onClosed);
    }

    private function onClosed():void {
        this.closeDialogs.dispatch();
        //this.showDailyCalendarSignal.dispatch();
    }


}
}//package kabam.rotmg.packages.view
