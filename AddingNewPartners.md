# Adding New Partners

The Partners are available on the Semantic Repository and are inserted there by the [RSS-to-Turtle](https://github.com/W3CBrasil/od4d-rss-to-turtle) gem, via the [Insert Static Datasets](https://github.com/W3CBrasil/od4d-rss-to-turtle/blob/master/bin/insert_static_datasets) executable

In order to add a new partner one must:

**Edit** the [partners.ttl file](https://github.com/W3CBrasil/od4d-rss-to-turtle/blob/master/assets/static-datasets/partners.ttl) and add a new triples-set as follows:

```xml
<http://platform.od4d.org/> a schema:Organization;
    schema:name        "Partner's Name";
    schema:url         <http://some.url.com/>;
    schema:logo        "logo.png";
    schema:description "Partner description".
```

Keep in mind that the schema:logo triple is currently deprecated, but if needs be there must be an image file with that name on the [images asset path](https://github.com/W3CBrasil/od4d.org/tree/master/app/assets/images) of the [od4d.org repo](https://github.com/W3CBrasil/od4d.org/).

**Save and commit** the file

**Check** the [Snap-CI](https://snap-ci.com/W3CBrasil/od4d-rss-to-turtle/branch/master) dashboard to guarantee that the build passed and that the STAGINGDEPL **executed without errors**. That will ensure that the gem was properly built, executed and scheduled.

Finally, **execute** the PRODDEPLOY step. This will send the modifications to the production server.