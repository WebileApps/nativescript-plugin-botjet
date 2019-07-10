import * as utils from "tns-core-modules/utils/utils";
import { BotJetSDKCommon } from './botjet.common';
import { BotJetConfig } from ".";

declare const ai : any;

export class BotJetSDK extends BotJetSDKCommon {
    public static launchChatWithConfig(config: BotJetConfig) : void {
        let options = new ai.botjet.android.nativesdk.model.BotConfig();
        options.setBotId(config.botId);
        options.setClientId(config.clientId);
        
        if (config.accentColor) {
            options.setAccentColor("#323b8c");
        }
        if (config.title) {
            options.setTitle(config.title);
        }
        if (config.isAnonymous) {
            options.setAnonymous(config.isAnonymous);
        }
        if (config.botIcon) {
            options.setBotIcon(config.botIcon);
        }
        options.setHost(config.host || "https://qa.botjet.ai");
        options.setLocationRequired(config.isLocationRequired || true);
        if (config.senderId) {
            options.setSenderId(config.senderId);
        }

        if (config.profileMeta) { 
            options.setProfileMeta(config.profileMeta.toString());
        }

        let intent = new android.content.Intent(utils.ad.getApplicationContext(), ai.botjet.android.nativesdk.activities.ChatActivity.class);
        intent.putExtra("BOT_CONFIG", options);
        intent.setFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
        utils.ad.getApplicationContext().startActivity(intent);
    }
}
