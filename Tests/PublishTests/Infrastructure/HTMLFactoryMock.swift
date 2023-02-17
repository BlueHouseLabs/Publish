/**
*  Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

@testable import Publish
import Plot

final class HTMLFactoryMock<Site: Website>: HTMLFactory {
    typealias Closure<T> = (T, PublishingContext<Site>) throws -> HTMLTemplate

    var makeIndexHTML: Closure<Index> = { _, _ in HTML(.body()).asTemplate }
    var makeSectionHTML: Closure<Section<Site>> = { _, _ in HTML(.body()).asTemplate }
    var makeItemHTML: Closure<Item<Site>> = { _, _ in HTML(.body()).asTemplate }
    var makePageHTML: Closure<Page> = { _, _ in HTML(.body()).asTemplate }
    var makeTagListHTML: Closure<TagListPage>? = { _, _ in HTML(.body()).asTemplate }
    var makeTagDetailsHTML: Closure<TagDetailsPage>? = { _, _ in HTML(.body()).asTemplate }

    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTMLTemplate {
        try makeIndexHTML(index, context)
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTMLTemplate {
        try makeSectionHTML(section, context)
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTMLTemplate {
        try makeItemHTML(item, context)
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTMLTemplate {
        try makePageHTML(page, context)
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTMLTemplate? {
        try makeTagListHTML?(page, context)
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTMLTemplate? {
        try makeTagDetailsHTML?(page, context)
    }
}
