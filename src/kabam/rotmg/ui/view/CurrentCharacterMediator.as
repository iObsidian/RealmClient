package kabam.rotmg.ui.view
{
import robotlegs.bender.bundles.mvcs.Mediator;
import com.company.assembleegameclient.screens.CharacterSelectionAndNewsScreen;
import kabam.rotmg.core.model.PlayerModel;
import kabam.rotmg.classes.model.ClassesModel;
import kabam.rotmg.core.signals.SetScreenSignal;
import kabam.rotmg.game.signals.PlayGameSignal;
import kabam.rotmg.ui.signals.ChooseNameSignal;
import kabam.rotmg.ui.signals.NameChangedSignal;
import kabam.rotmg.packages.control.InitPackagesSignal;
import kabam.rotmg.packages.control.BeginnersPackageAvailableSignal;
import kabam.rotmg.packages.control.PackageAvailableSignal;
import kabam.rotmg.promotions.model.BeginnersPackageModel;
import kabam.rotmg.dialogs.control.OpenDialogSignal;
import com.company.assembleegameclient.screens.NewCharacterScreen;
import com.company.assembleegameclient.appengine.SavedCharacter;
import kabam.rotmg.classes.model.CharacterClass;
import kabam.rotmg.game.model.GameInitData;

public class CurrentCharacterMediator extends Mediator
{


    [Inject]
    public var view:CharacterSelectionAndNewsScreen;

    [Inject]
    public var playerModel:PlayerModel;

    [Inject]
    public var classesModel:ClassesModel;

    [Inject]
    public var setScreen:SetScreenSignal;

    [Inject]
    public var playGame:PlayGameSignal;

    [Inject]
    public var chooseName:ChooseNameSignal;

    [Inject]
    public var nameChanged:NameChangedSignal;

    [Inject]
    public var initPackages:InitPackagesSignal;

    [Inject]
    public var beginnersPackageAvailable:BeginnersPackageAvailableSignal;

    [Inject]
    public var packageAvailable:PackageAvailableSignal;

    [Inject]
    public var beginnerModel:BeginnersPackageModel;

    [Inject]
    public var openDialog:OpenDialogSignal;

    public function CurrentCharacterMediator()
    {
        super();
    }

    override public function initialize() : void
    {
        this.view.initialize(this.playerModel);
        this.view.close.add(this.onClose);
        this.view.newCharacter.add(this.onNewCharacter);
        this.view.showClasses.add(this.onNewCharacter);
        this.view.chooseName.add(this.onChooseName);
        this.view.playGame.add(this.onPlayGame);
        this.nameChanged.add(this.onNameChanged);
        this.beginnersPackageAvailable.add(this.onBeginner);
        this.packageAvailable.add(this.onPackage);
        this.initPackages.dispatch();
    }

    private function onPackage() : void
    {
        this.view.showPackageButton();
    }

    private function onBeginner() : void
    {
        this.view.showBeginnersOfferButton();
    }

    override public function destroy() : void
    {
        this.nameChanged.remove(this.onNameChanged);
        this.beginnersPackageAvailable.remove(this.onBeginner);
        this.view.close.remove(this.onClose);
        this.view.newCharacter.remove(this.onNewCharacter);
        this.view.chooseName.remove(this.onChooseName);
        this.view.showClasses.remove(this.onNewCharacter);
        this.view.playGame.remove(this.onPlayGame);
    }

    private function onNameChanged(param1:String) : void
    {
        this.view.setName(param1);
    }

    private function onNewCharacter() : void
    {
        this.setScreen.dispatch(new NewCharacterScreen());
    }

    private function onClose() : void
    {
        this.setScreen.dispatch(new TitleView());
    }

    private function onChooseName() : void
    {
        this.chooseName.dispatch();
    }

    private function onPlayGame() : void
    {
        var _loc1_:SavedCharacter = this.playerModel.getCharacterByIndex(0);
        this.playerModel.currentCharId = _loc1_.charId();
        var _loc2_:CharacterClass = this.classesModel.getCharacterClass(_loc1_.objectType());
        _loc2_.setIsSelected(true);
        _loc2_.skins.getSkin(_loc1_.skinType()).setIsSelected(true);
        var _loc3_:GameInitData = new GameInitData();
        _loc3_.createCharacter = false;
        _loc3_.charId = _loc1_.charId();
        _loc3_.isNewGame = true;
        this.playGame.dispatch(_loc3_);
    }
}
}
