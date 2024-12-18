# zabbix-catppuccin
catppuccin-mocha theme for zabbix, If you want other flavors open an issue and I might make it.
## Preview
![Screenshot 2024-12-18 at 15-12-41 zabbix leadseason eu Dashboard](https://github.com/user-attachments/assets/35634259-13d4-4966-a047-02917d12d587)


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

## Building

```
sassc catppuccin-mocha.scss catppuccin-mocha.css
```

## Install
Steps might differ depending on install method and or distribution. Install will be done zabbix official pkg's installed on Ubuntu server.

### Direct download from repository
> [!WARNING]
> This will overwrite your APP.php will get overwritten!

Run the following commands as root:
```sh
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/include/classes/core/APP.php -o /usr/share/zabbix/include/classes/core/APP.php 
curl https://raw.githubusercontent.com/LeadSeason/zabbix-catppuccin/refs/heads/master/assets/styles/catppuccin-mocha.css -o /usr/share/zabbix/assets/styles/catppuccin-mocha.css 

```
> [!NOTE]
> Your APP.php might reset on system / zabbix update.

MariaDB: for graph theme add the graph_theme.sql to the database.
    > [!INFO]
    > The sql file uses database of `Zabbix` and theme index of 5. 

### From source
1. Clone the repo and the submodules `git clone --recursive https://github.com/LeadSeason/zabbix-catppuccin/`  
    Depending on your setup you might need to change the zabbix version, You can change the version of zabbix first by navigating to the folder then with `git checkout <version>`
2. Build the css using sassc `sassc catppuccin-mocha.scss catppuccin-mocha.css`
3. Zabbix install is located in in `/usr/share/zabbix/`
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
4. Zabbix install is located in `/usr/share/zabbix/`
    Add the css file to `assets/styles/catppuccin-mocha.css`
5. MariaDB: for graph theme add the graph_theme.sql to the database.
    > [!INFO]
    > The sql file uses database of `Zabbix` and theme index of 5. 
    
