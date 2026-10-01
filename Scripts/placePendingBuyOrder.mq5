//+------------------------------------------------------------------+
//|                                         placePendingBuyOrder.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

#include <Trade\Trade.mqh>

CTrade *Trade;

//--- input parameters
input bool     useSpread = false;                       //Include spread in the calculation of the entry & stop loss
input int entryBar = 1;                                //The bar to use for the entry.
input int      stopLossBar = 1;                        //The bar to use for the stop loss.
input int entryPips = 0;                               //Number of pips above the entry bar, to enter trade. 
input int   stopLossPips = 0;                          //Number of pips below the stop loss bar, to place stop loss. 
input double rewardToRisk = 1.0;                       //Reward to risk ratio.
input double Lotsize = 0.1;                           //volume of trade in lots  
input string text = "";                                //Comment


//--- variables to do calculations
double highOfEntryBar;
double lowOfStopLossBar;
double entryPrice;               //entry price of pending buy order
double stopLoss;                 //stop loss of pending buy order
double takeProfit;               //take profit of pending buy order
double spread=0.0;
int ratesSize;                   //size of the rates array


//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

   MqlRates rates[];
   ArraySetAsSeries(rates,true);
   
   ratesSize = (entryBar >= stopLossBar) ? entryBar + 1: stopLossBar +1;

//---Checking and Copying Prices into the Rates Object
   if(CopyRates(_Symbol,_Period,0,ratesSize,rates)==-1)
     {
      Print("Error Copying Price Data",GetLastError());
      return;
     }
     
     lowOfStopLossBar = rates[stopLossBar].low;
     
     highOfEntryBar = rates[entryBar].high;
     
     if(useSpread)
     {
         spread = getSpread();
     }
     
     entryPrice = highOfEntryBar + spread + (10*entryPips*_Point);
     stopLoss = lowOfStopLossBar - spread - (10*stopLossPips*_Point);
     takeProfit = entryPrice + (rewardToRisk *(entryPrice - stopLoss));
     
     Print ("_Point is " + (string) _Point);
     Print ("Spread is " + (string) spread);
     Print ("Entry is " + (string) entryPrice);
     Print ("Stop loss is " + (string) stopLoss);
     Print ("Take profit is " + (string) takeProfit);
     
     Trade = new CTrade;
     Trade.BuyStop(Lotsize,entryPrice,_Symbol,stopLoss,takeProfit,ORDER_TIME_GTC,0,text + " " + getPeriod());
     delete Trade;

  }
//+------------------------------------------------------------------+

double getSpread()
{
   double ask,bid;
   ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
   
   if(_Symbol == "XAUUSD.a")
   {
      spread = NormalizeDouble(ask-bid,2);
   }
   else if(_Symbol == "XAUAUD.a")
   {
      spread = NormalizeDouble(ask-bid,2);
   }
   else if(_Symbol == "XAGUSD.a")
   {
      spread = NormalizeDouble(ask-bid,3);
   }
   else if(StringFind(_Symbol,"JPY.a", 0)!=-1)
   {
      spread = NormalizeDouble(ask-bid,3);
   }
   else
   {
      spread = NormalizeDouble(ask-bid,5);
   }
   return spread;
   
}

string getPeriod()
  {
      if(_Period==PERIOD_M1) return "M1";
      if(_Period==PERIOD_M2) return "M2";
      if(_Period==PERIOD_M3) return "M3";
      if(_Period==PERIOD_M4) return "M4";
      if(_Period==PERIOD_M5) return "M5";
      if(_Period==PERIOD_M6) return "M6";
      if(_Period==PERIOD_M10) return "M10";
      if(_Period==PERIOD_M12) return "M12";
      if(_Period==PERIOD_M15) return "M15";
      if(_Period==PERIOD_M20) return "M20";
      if(_Period==PERIOD_M30) return "M30";
      if(_Period==PERIOD_H1) return "H1";
      if(_Period==PERIOD_H2) return "H2";
      if(_Period==PERIOD_H3) return "H3";
      if(_Period==PERIOD_H4) return "H4";
      if(_Period==PERIOD_H6) return "H6";
      if(_Period==PERIOD_H8) return "H8";
      if(_Period==PERIOD_H12) return "H12";
      if(_Period==PERIOD_D1) return "D1";
      if(_Period==PERIOD_W1) return "W1";
      if(_Period==PERIOD_MN1) return "MN";
      return "No timeframe";
  }