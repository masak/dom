use v6;
use Test;

plan 6;

use DOM;

# Code adapted from
# http://se.php.net/manual/en/domimplementation.createdocument.php
my $doctype
    = DOM::DOMImplementation.createDocumentType('html',
            '-//W3C//DTD XHTML 1.0 Transitional//EN',
            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd');

{
    my $document = DOM::DOMImplementation.createDocument(Str, 'html', $doctype);

    my $docelem = $document.documentElement;
    isa_ok $docelem, DOM::Element,
            "document.element is an Element";
    is $docelem.localName, 'html',
            "local name of document.element equals that of document";
}

{
    my $document = DOM::DOMImplementation.createDocument(Str, 'foo', $doctype);

    my $element = $document.createElement('bar');
    my $docelem = $document.documentElement;
    is +$docelem.childNodes, 0, "no children before appending";
    $docelem.appendChild($element);
    is +$docelem.childNodes, 1, "an element was added";
    ok $docelem.firstChild === $element, "and it's the right element";
    ok $element.ownerDocument === $document,
            "the element belongs to the document";
}
