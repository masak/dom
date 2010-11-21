use v6;

class DOM::DocumentType { ... }
class DOM::Document { ... }
class DOM::Element { ... }

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
            :documentElement(DOM::Element.new())
        );
    }
}

class DOM::DocumentType {
    has Str $.publicId;
    has Str $.systemId;
}

role DOM::Node {
    has Str $.localName;
}

class DOM::Document does DOM::Node {
    has DOM::DocumentType $.doctype;
    has DOM::Element      $.documentElement;
}

class DOM::Element does DOM::Node {
}
