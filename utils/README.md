# Usage
This folder will contain some scripts that I find useful when doing ZTP demos and PoCs.

## Redfish Testing

I wrote a [blog](https://cloudcult.dev/fishing-for-sushy-with-curl/) about how to test and use Redfish for servers such as Dell, HP, Supermicro and others. Below is a method of using authenticated Redfish calls via `curl`.

Export variables:
```
REDFISH_HOST="10.100.100.5"
REDFISH_USER='admin'
REDFISH_PASS='password'
REDFISH_SYSTEM="1"
REDFISH_MANAGER="1"
```

Run Redfish commands:
```
curl -s -k -u ''"$REDFISH_USER"'':''"$REDFISH_PASS"'' https://$REDFISH_HOST/redfish/v1/Systems/$REDFISH_SYSTEM/
```
