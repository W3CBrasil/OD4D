# Content Editing

In order to create an **article** the user must head to the CMS's URL, which is http://platform.od4d.org/casein.

The CMS has two sections:

- Seções
- Posts

#### Seções

These are the article sections to be used on the posts. They may have both a Name and a Description.

#### Posts

These are the Articles themselves. They need to have a section in order to be listed beneath it on the website and may also have several comma separated values on the **about** field.

#### Internationalization (i18n)

Beforehand we should state that there are two areas affected by internationalization

- Published content
- Static texts/messages

The former, content, currently is **not available** for i18n. Thus there are no options within the CMS to set the language of a given Article or Article Section.

But as for the latter, texts and messages, the localization is available through the Rails platform. The localization files should be located in "od4d.org/config/locales" and shall be named based on each specific language. Currently there is only one file, "en.yml", corresponding to English.

This file is a [YML](http://en.wikipedia.org/wiki/YAML) file containing keys (the messages identifiers, used within the Rails app) and values (the actual messages and texts to be displayed to the user). For example:

```yml
  menu_1: "ABOUT THE PLATFORM"
  menu_2: "TERMS AND CONDITIONS"
  menu_3: "PRIVACY POLICE"
```

These messages are loaded within the Rails app as follows:

```ruby
      <h3>OD4D</h3>
      <ul>
        <li><%= link_to t('menu_1'), {controller: "pages", action: "about"} %></li>
        <li><%= link_to t('menu_2'), {controller: "pages", action: "terms_and_conditions"} %></li>
        <li><%= link_to t('menu_3'), {controller: "pages", action: "privacy_policy"} %></li>
      </ul>
```

In order to add a new translation, one just needs to create the proper YML file (pt-br.yml, es.yml, etc), copy the contents from the ***en.yml*** file and translate all the **values**. Remember that the **keys must not be altered**. Also, all the files must have the same key/values pair.
