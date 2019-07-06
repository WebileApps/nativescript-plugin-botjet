import { BotJetSDKCommon } from './botjet.common';

export declare class BotJetConfig {
  clientId : string;
  botId : string;
  senderId : string;

  isAnonymous?: boolean;
  title ?: string;
  isLocationRequired ?: boolean;
  host ?: string;
  profileMeta ?: any;
  botIcon ?: string;
  accentColor ?: string;

}

export declare class BotJetSDK extends BotJetSDKCommon {
  // define your typings manually
  // or..
  public static launchChatWithConfig(config: BotJetConfig) : void;
}
