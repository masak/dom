use v6;

class DOM::DocumentType { ... }
class DOM::Document { ... }
class DOM::Element { ... }
class DOM::NodeList { ... }

class DOM::DOMImplementation {
    method createDocumentType(
        Str $qualifiedName,
        Str $publicId,
        Str $systemId
            --> DOM::DocumentType)
    {
        return DOM::DocumentType.new(:$publicId, :$systemId);
    }

    method createDocument(
        Str $namespaceURI,
        Str $qualifiedName,
        DOM::DocumentType $doctype
            --> DOM::Document)
    {
        return DOM::Document.new(
            :localName($qualifiedName), :$doctype,
            :documentElement(DOM::Element.new(:localName($qualifiedName)))
        );
    }
}

class DOM::DocumentType {
    has Str $.publicId;
    has Str $.systemId;
}

role DOM::Node {
    has Str $.localName;

    method childNodes(--> DOM::NodeList) {
        return DOM::NodeList.new();
    }
}

class DOM::Document does DOM::Node {
    has DOM::DocumentType $.doctype;
    has DOM::Element      $.documentElement;

    method createElement(Str $tagname) {
        return DOM::Element.new(:localname($tagname));
    }
}

class DOM::Element does DOM::Node {
}

class DOM::NodeList {
    method Numeric(--> Int) {
        return 0;
    }
}
