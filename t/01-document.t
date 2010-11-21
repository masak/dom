use v6;
use Test;

plan 7;

use DOM;

# Code adapted from
# http://se.php.net/manual/en/domimplementation.createdocument.php
my $doctype
    = DOM::DOMImplementation.createDocumentType('html',
            '-//W3C//DTD XHTML 1.0 Transitional//EN',
            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd');

my $document = DOM::DOMImplementation.createDocument(Str, 'html', $doctype);

isa_ok $document, DOM::Document, "the document is a DOM::Document";
isa_ok $document.doctype, DOM::DocumentType,
    "the doctype is a DOM::DocumentType";
ok $document.doctype === $doctype, "...and it's the one we passed in";

my $documentWithoutDoctype
    = DOM::DOMImplementation.createDocument(Str, 'html', DOM::DocumentType);
ok !$documentWithoutDoctype.doctype.defined,
   "doctype is undefined if type object passed in";

is $document.localName, 'html', "local name was set";
is $doctype.publicId, '-//W3C//DTD XHTML 1.0 Transitional//EN',
    "publicId was set";
is $doctype.systemId,
    'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd',
    "systemId was set";
