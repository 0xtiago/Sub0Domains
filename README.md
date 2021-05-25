# Sub0Domains

**Sub0Domains** is a quite simple bash script subdomain enumeration toolkit. Based on several tool chain script written by several bug hunters, it is just one more else. 

This script was written firstly to attend my own need, executing several subdomain enumeration tools and aggregating their results, avoiding discrepancies.

![](https://res.cloudinary.com/dtr6hzxnx/image/upload/v1621644729/blog/subzero_dvqezk.jpg)

**Tools used:**

- [SubScraper](https://github.com/m8r0wn/subscraper)
- [Sublist3r](https://github.com/aboul3la/Sublist3r)
- [AssetFinder](https://github.com/tomnomnom/assetfinder)

## Install

Written for Debian-based Linux distributions (*Kali* & *Ubuntu*):

```bash
git clone https://github.com/0xtiago/Sub0Domains
cd Sub0Domains; chmod +x install.sh run.sh
sudo ./install.sh
```

## How to Use

Add your domains to `targets.txt`:

```bash
echo microsoft.com > targets.txt
```

Execute the main script:

```bash
./run.sh
```



![](https://res.cloudinary.com/dtr6hzxnx/image/upload/v1621644391/blog/Sub0Domains_Exampe_kzdgsd.png)

## Configuring Censys or Shodan keys

You can modify the script to aggregate results of any other tool, feel free to use other tools and their API features, like Shodan or Censys. In order to use such APIs, you just need to create a file named `api.config`, and insert your keys like this:

```
censys_api="835d.....395"
censys_secret="eIf....KFXJN"
shodan_key="WaI9...yS3"
```

