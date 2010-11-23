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
    has Str       $.localName;
    has DOM::Node @!childNodes;

    method childNodes(--> DOM::NodeList) {
        return DOM::NodeList.new(@!childNodes);
    }

    method firstChild(--> DOM::Node) {
        return @!childNodes[0];
    }

    method appendChild(DOM::Node $newChild --> DOM::Node) {
        @!childNodes.push($newChild);
        return $newChild;
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
    has DOM::Node @!nodes;

    method new(@nodes) {
        self.bless(*, :@nodes);
    }

    method Numeric(--> Int) {
        return @!nodes.elems;
    }
}
