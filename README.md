# zabbix-catppuccin
catppuccin-mocha theme for zabbix, If you want other flavors open an issue and I might make it.

## Preview
![Screenshot 2024-12-18 at 15-12-41 zabbix leadseason eu Dashboard](https://github.com/user-attachments/assets/35634259-13d4-4966-a047-02917d12d587)

## Older versions

This software currently supports only Zabbix 7.2 but you can build an older version of this software.  
Zabbix 7.0: [3ae7681](https://github.com/LeadSeason/zabbix-catppuccin/commit/3ae7681eaab6766d4735d2926d2fcc9d87c4732a)

## Install (From repo)
Steps might differ depending on install method and or distribution. Example Install will be done with zabbix official pkg's installed on Ubuntu server.

### Alert colors
Go to `Administration > General > Trigger displaying options` there you can change the alert colors.

<details>
<summary>Catppuccin Mocha</summary>

    Disaster: #F38BA8
    High: #EBA0AC
    Average: #FAB387
    Warning: #F9E2AF
    Information: #89B4FA
    Not classified: #6C7086
</details>

<details>
<summary>Original Zabbix alert colors</summary>

    Disaster: #E45959
    High: #E97659
    Average: #FFA059
    Warning: #FFC859
    Information: #7499FF
    Not classified: #97AAB3
</details>

> [!WARNING]
> If you have modified your APP.php file, this will overwrite APP.php
> APP.php might reset on Zabbix update.

Run the following commands as root:
```sh
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/ui/include/classes/core/APP.php -o /usr/share/zabbix/ui/include/classes/core/APP.php 
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/ui/assets/styles/catppuccin-mocha.css -o /usr/share/zabbix/ui/assets/styles/catppuccin-mocha.css 

```

For graph theme add the catppuccin-mocha.sql to the database. Otherwise your graphs will be blinding light.
```sh
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/catppuccin-mocha.sql | mariadb -u root
```
> [!INFO]
> The sql file uses database of `Zabbix` and theme index of 5. 

## Building (From source)
1. Clone the repo and the submodules `git clone --recursive https://github.com/LeadSeason/zabbix-catppuccin/`  
    Depending on your setup you might need to change the zabbix version, You can change the version of zabbix first by navigating to the zabbix submodule then with `git checkout <version>` you can change the version

2. Build the css using sassc `sassc catppuccin-mocha.scss catppuccin-mocha.css`

3. Zabbix install is located in in `/usr/share/zabbix/ui`
    edit the `include/classes/core/APP.php` and add the following php snippet in to Zbase. 
    ```php
    class APP extends ZBase {
        // Custom themes
        public static function getThemes() {
            return array_merge(parent::getThemes(), [
                'catppuccin-mocha' => _('Catppuccin Mocha')
            ]);
        }
    }
    ```
    > [!NOTE]
    > Your APP.php might reset on system / zabbix update.

4. Zabbix install is located in `/usr/share/zabbix/ui`
    Add the css file to `assets/styles/catppuccin-mocha.css`

5. MariaDB: Select the Zabbix database
    ```sql
    USE zabbix;
    ```
    Add the color configuration
    ```sql    
    INSERT INTO graph_theme (
      graphthemeid, theme, backgroundcolor, 
      graphcolor, gridcolor, maingridcolor, 
      gridbordercolor, textcolor, highlightcolor, 
      leftpercentilecolor, rightpercentilecolor, 
      nonworktimecolor, colorpalette
    ) 
    VALUES 
      (
        5, 'catppuccin-mocha', '1e1e2e', '1e1e2e', 
        '45475a', '585b70', '585b70', 'cdd6f4', 
        'f38ba8', 'a6e3a1', 'f38ba8', '313244', 
        'a6e3a1,eba0ac,74c7ec,fab387,eba0ac,cba6f7,f9e2af,74c7ec,f5c2e7,b4befe,94e2d5,f2cdcd,89ABF8,7EC25C,3165D5,79A277,AA73DE,FD5434,F21C3E,87AC4D,E89DF4'
      );
    ```

    
## Troubleshooting
### Theme is missing from the theme list.
You are missing the configuration from the APP.php file.
Reinstall with 
```shell
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/ui/assets/styles/catppuccin-mocha.css -o /usr/share/zabbix/ui/assets/styles/catppuccin-mocha.css
```