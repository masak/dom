use v6;
use Test;

plan 1;

use DOM;

# Code adapted from
# http://se.php.net/manual/en/domimplementation.createdocument.php
my $doctype
    = DOM::DOMImplementation.createDocumentType('html',
            '-//W3C//DTD XHTML 1.0 Transitional//EN',
            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd');

my $document = DOM::DOMImplementation.createDocument(Str, 'html', $doctype);

isa_ok $document.documentElement(), DOM::Element,
       "document.element is an Element";
