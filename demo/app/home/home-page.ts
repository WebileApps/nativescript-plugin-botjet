/*
In NativeScript, a file with the same name as an XML file is known as
a code-behind file. The code-behind is a great place to place your view
logic, and to set up your page’s data binding.
*/

import { NavigatedData, Page } from "tns-core-modules/ui/page";
import { BotJetSDK, BotJetConfig } from "nativescript-plugin-botjet";
import { HomeViewModel } from "./home-view-model";

export function onNavigatingTo(args: NavigatedData) {
    const page = <Page>args.object;

    page.bindingContext = new HomeViewModel();
}

export function onTap() {

    const config : BotJetConfig =  { 
        clientId : "",
        botId : "",
        title : "CallHealth Chat Bot",
        accentColor : "#323b8c",
        senderId : ""
    }

    BotJetSDK.launchChatWithConfig(config);
}
