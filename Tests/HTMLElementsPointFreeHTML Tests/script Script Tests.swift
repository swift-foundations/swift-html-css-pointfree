import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Script Element Tests")
    struct ScriptTests {
        @Test("Basic inline script renders correctly")
        func basicInlineScriptRendersCorrectly() {
            assertInlineSnapshot(
                of: Script {
                    "console.log('Hello, World!');"
                },
                as: .html
            ) {
                """
                <script>console.log('Hello, World!');</script>
                """
            }
        }

        @Test("External script renders correctly")
        func externalScriptRendersCorrectly() {
            assertInlineSnapshot(
                of: Script()
                    .attribute("src", "/js/main.js"),
                as: .html
            ) {
                """
                <script src="/js/main.js"></script>
                """
            }
        }

        @Test("Script with type attribute renders correctly")
        func scriptWithTypeAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Script {
                    "console.log('ES6 module');"
                }
                .attribute("type", "module"),
                as: .html
            ) {
                """
                <script type="module">console.log('ES6 module');</script>
                """
            }
        }

        @Test("Script with defer attribute renders correctly")
        func scriptWithDeferAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Script()
                    .attribute("src", "/js/deferred.js")
                    .attribute("defer", ""),
                as: .html
            ) {
                """
                <script src="/js/deferred.js" defer></script>
                """
            }
        }

        @Test("Script with async attribute renders correctly")
        func scriptWithAsyncAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Script()
                    .attribute("src", "/js/async.js")
                    .attribute("async", ""),
                as: .html
            ) {
                """
                <script src="/js/async.js" async></script>
                """
            }
        }

        @Test("Script with integrity and crossorigin renders correctly")
        func scriptWithIntegrityAndCrossoriginRendersCorrectly() {
            assertInlineSnapshot(
                of: Script()
                    .attribute("src", "https://cdn.example.com/library.js")
                    .attribute("integrity", "sha384-abc123")
                    .attribute("crossorigin", "anonymous"),
                as: .html
            ) {
                """
                <script src="https://cdn.example.com/library.js" integrity="sha384-abc123" crossorigin="anonymous"></script>
                """
            }
        }

        @Test("Script with nonce attribute renders correctly")
        func scriptWithNonceAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Script {
                    "console.log('Secure script');"
                }
                .attribute("nonce", "abc123def456"),
                as: .html
            ) {
                """
                <script nonce="abc123def456">console.log('Secure script');</script>
                """
            }
        }

        @Test("JSON-LD script renders correctly")
        func jsonLDScriptRendersCorrectly() {
            assertInlineSnapshot(
                of: Script {
                    """
                    {
                      "@context": "https://schema.org",
                      "@type": "WebSite",
                      "name": "Example"
                    }
                    """
                }
                .attribute("type", "application/ld+json"),
                as: .html
            ) {
                """
                <script type="application/ld+json">{
                  "@context": "https://schema.org",
                  "@type": "WebSite",
                  "name": "Example"
                }</script>
                """
            }
        }
    }
}
