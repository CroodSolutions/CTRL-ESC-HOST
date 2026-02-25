## Subdomain Smuggling of LotL Payload as Image or Text

This attack is relevant for use cases where very aggressive policies have been applied to limit what URLs you can visit. In such scenarios, there is almost always an exclusion to allow communicaiton with at least a few domains:
 - The company's own domains/subdomains (these could be tightly scoped, but they usually aren't).
 - Key SaaS/hosting providers used/trusted by the target org (look for DNS txt records for domain validations to find these).
 - Software providers like Microsoft, Google, or Amazon that may have overscoped allow rules.

Why does this matter? Because, across all of these organizations and providers, it is highly likely there is something available where you can setup an account (free or paid) and attach a file to some sort of ticket, request, inquiry, or message. Chances are that if that file is an LotL binary, beacon payload, RMM-install, one of these things will give the adversary covert control of a host, with very low detectability.  


