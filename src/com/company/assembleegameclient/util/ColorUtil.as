package com.company.assembleegameclient.util
{
public class ColorUtil
{
    public static function rangeRandomSmart(_arg_1:uint, _arg_2:uint):Number
    {
        var _loc3_:uint = _arg_1 >> 16 & 255;
        var _loc4_:uint = _arg_1 >> 8 & 255;
        var _loc5_:uint = _arg_1 & 255;
        var _loc6_:uint = _arg_2 >> 16 & 255;
        var _loc7_:uint = _arg_2 >> 8 & 255;
        var _loc8_:uint = _arg_2 & 255;
        var _loc9_:* = _loc6_ + Math.random() * (_loc3_ - _loc6_);
        var _loc10_:* = _loc7_ + Math.random() * (_loc4_ - _loc7_);
        var _loc11_:* = _loc8_ + Math.random() * (_loc5_ - _loc8_);
        return _loc9_ << 16 | _loc10_ << 8 | _loc11_;
    }

    public static function randomSmart(param1:uint) : Number
    {
        var _loc2_:uint = param1 >> 16 & 255;
        var _loc3_:uint = param1 >> 8 & 255;
        var _loc4_:uint = param1 & 255;
        var _loc5_:* = Math.max(0,Math.min(255,_loc2_ + RandomUtil.plusMinus(_loc2_ * 0.05)));
        var _loc6_:* = Math.max(0,Math.min(255,_loc3_ + RandomUtil.plusMinus(_loc3_ * 0.05)));
        var _loc7_:* = Math.max(0,Math.min(255,_loc4_ + RandomUtil.plusMinus(_loc4_ * 0.05)));
        return _loc5_ << 16 | _loc6_ << 8 | _loc7_;
    }

    public static function rangeRandomMix(_arg_1:uint, _arg_2:uint):Number
    {
        var _loc3_:uint = _arg_1 >> 16 & 255;
        var _loc4_:uint = _arg_1 >> 8 & 255;
        var _loc5_:uint = _arg_1 & 255;
        var _loc6_:uint = _arg_2 >> 16 & 255;
        var _loc7_:uint = _arg_2 >> 8 & 255;
        var _loc8_:uint = _arg_2 & 255;
        var _loc9_:Number = Math.random();
        var _loc10_:* = _loc6_ + _loc9_ * (_loc3_ - _loc6_);
        var _loc11_:* = _loc7_ + _loc9_ * (_loc4_ - _loc7_);
        var _loc12_:* = _loc8_ + _loc9_ * (_loc5_ - _loc8_);
        return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
    }

    public static function rangeRandom(_arg_1:uint, _arg_2:uint):Number
    {
        return _arg_2 + Math.random() * (_arg_1 - _arg_2);
    }
}
} 