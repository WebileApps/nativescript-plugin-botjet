import { BotJetSDKCommon } from './botjet.common';
import { BotJetConfig } from ".";
import { Page } from "tns-core-modules/ui/page";
import { topmost } from "tns-core-modules/ui/frame";

declare var BJChatViewControllerOptions, BJWebSDK;

export class BotJetSDK extends BotJetSDKCommon {
    public static launchChatWithConfig(config: BotJetConfig) : void {
        const options = BJChatViewControllerOptions.alloc().init();
        options.clientId = config.clientId;
        options.botId = config.botId;
        if (config.title) {
            options.title = config.title;
        }
        if (config.isAnonymous) {
            options.isAnonymous = config.isAnonymous;
        }
        if (config.accentColor) {
            options.accentColor = config.accentColor;
        }
        if (config.botIcon) {
            options.botIcon = config.botIcon;
        }
        if (config.host) {
            options.host = config.host;
        }
        if (config.isLocationRequired) {
            options.isLocationRequired = config.isLocationRequired;
        }
        if (config.profileMeta) {
            options.profileMeta = config.profileMeta;
        }
        if (config.senderId) {
            options.senderId = config.senderId;
        }

        topmost().currentPage.ios.presentViewControllerAnimatedCompletion(BJWebSDK.viewControllerWithConfig(options), true, null);
    }
}