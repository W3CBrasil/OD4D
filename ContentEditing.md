# Content Editing

In order to create an **article** the user must head to the CMS's URL, which is http://platform.od4d.org/casein.

The CMS has two sections:

- Seções
- Posts

#### Seções

These are the article sections to be used on the posts. They may have both a Name and a Description.

#### Posts

These are the Articles themselves. They need to have a section in order to be listed beneath it on the website and may also have several comma separated values on the **about** field.

#### Adding Sections

The sections included in CMS will result in dynamic pages, which show the content of posts platform. It is necessary that the sections are inserted prior to the classification of posts. To do this:

1. Click in the menu "Seções"
1. To the right of your screen, click in "Adicionar Seção"
1. Add a name and description for your section
1. Click "Adicionar" button.

If you want to edit any section, access them from "Sections" menu's list.

#### Writing posts

To create a post as a contributor to the site:

1. Click in "Adicionar Novo Post", in the right side of your screen; 
1. Fill the form of Título (Title), Autor (Author), Seção (Section), Assunto (Subject) e Conteúdo (Content);
1. Click in "Salvar" button.

#### Flagging posts already published

Migrated posts from the old site need to be flagged so that they can assign more value to your content. To do this:

1. Access the "Posts" menu
1. Click on the item you want to edit
1. In the combobox "Seção", select the desired option
1. Click in "Salvar" button.

It is important to remember that posts will only be able to be flagged beforehand if there are sections to which they may be associated.

#### Internationalization (i18n)

First of all, we should state that there are two areas affected by internationalization

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

```erb
      <h3>OD4D</h3>
      <ul>
        <li><%= link_to t('menu_1'), {controller: "pages", action: "about"} %></li>
        <li><%= link_to t('menu_2'), {controller: "pages", action: "terms_and_conditions"} %></li>
        <li><%= link_to t('menu_3'), {controller: "pages", action: "privacy_policy"} %></li>
      </ul>
```

In order to add a new translation, one just needs to create the proper YML file (pt-br.yml, es.yml, etc), copy the contents from the ***en.yml*** file and translate all the **values**. Remember that the **keys must not be altered**. Also, all the files must have the same key/values pair.
