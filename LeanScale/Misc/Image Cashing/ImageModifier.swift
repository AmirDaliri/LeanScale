
import Foundation

/// An `ImageModifier` can be used to change properties on an Image in between
/// cache serialization and use of the image.
public protocol ImageModifier {
    /// Modify an input `Image`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: The return value will be unmodified if modifying is not possible on
    ///         the current platform.
    /// - Note: Most modifiers support UIImage or NSImage, but not CGImage.
    func modify(_ image: Image) -> Image
}

extension ImageModifier {
    func modify(_ image: Image?) -> Image? {
        guard let image = image else {
            return nil
        }
        return modify(image)
    }
}

typealias ModifierImp = ((Image) -> Image)

fileprivate struct GeneralModifier: ImageModifier {
    let identifier: String
    let m: ModifierImp
    func modify(_ image: Image) -> Image {
        return m(image)
    }
}

/// The default modifier.
/// Does nothing and returns the image it was given
public struct DefaultImageModifier: ImageModifier {

    /// A default `DefaultImageModifier` which can be used everywhere.
    public static let `default` = DefaultImageModifier()

    /// Initialize a `DefaultImageModifier`
    private init() {}

    /// Modify an input `Image`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: See documentation of `ImageModifier` protocol for more.
    public func modify(_ image: Image) -> Image {
        return image
    }
}

/// A custom modifier.
/// Can be initialized with a block to modify images in a custom way
public struct AnyImageModifier: ImageModifier {

    /// A block which modifies images, or returns the original image
    /// if modification cannot be performed.
    let block: (Image) -> Image

    /// Initialize an `AnyImageModifier`
    public init(modify: @escaping (Image) -> Image) {
        block = modify
    }

    /// Modifies an input `Image` using this `AnyImageModifier`'s `block`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: See documentation of `ImageModifier` protocol for more.
    public func modify(_ image: Image) -> Image {
        return block(image)
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

/// Modifier for setting the rendering mode of images.
/// Only UI-based images are supported; if a non-UI image is passed in, the
/// modifier will do nothing.
public struct RenderingModeImageModifier: ImageModifier {

    /// The rendering mode to apply to the image.
    public let renderingMode: UIImage.RenderingMode

    /// Initialize a `RenderingModeImageModifier`
    ///
    /// - parameter renderingMode: The rendering mode to apply to the image.
    ///                            Default is .automatic
    public init(renderingMode: UIImage.RenderingMode = .automatic) {
        self.renderingMode = renderingMode
    }

    /// Modify an input `Image`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: See documentation of `ImageModifier` protocol for more.
    public func modify(_ image: Image) -> Image {
        return image.withRenderingMode(renderingMode)
    }
}

/// Modifier for setting the `flipsForRightToLeftLayoutDirection` property of images.
/// Only UI-based images are supported; if a non-UI image is passed in, the
/// modifier will do nothing.
public struct FlipsForRightToLeftLayoutDirectionImageModifier: ImageModifier {
    /// Initialize a `FlipsForRightToLeftLayoutDirectionImageModifier`
    ///
    /// - Note: On versions of iOS lower than 9.0, the image will be returned
    ///         unmodified.
    public init() {}

    /// Modify an input `Image`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: See documentation of `ImageModifier` protocol for more.
    public func modify(_ image: Image) -> Image {
        if #available(iOS 9.0, *) {
            return image.imageFlippedForRightToLeftLayoutDirection()
        } else {
            return image
        }
    }
}

/// Modifier for setting the `alignmentRectInsets` property of images.
/// Only UI-based images are supported; if a non-UI image is passed in, the
/// modifier will do nothing.
public struct AlignmentRectInsetsImageModifier: ImageModifier {

    /// The alignment insets to apply to the image
    public let alignmentInsets: UIEdgeInsets

    /// Initialize a `AlignmentRectInsetsImageModifier`
    public init(alignmentInsets: UIEdgeInsets) {
        self.alignmentInsets = alignmentInsets
    }

    /// Modify an input `Image`.
    ///
    /// - parameter image:   Image which will be modified by `self`
    ///
    /// - returns: The modified image.
    ///
    /// - Note: See documentation of `ImageModifier` protocol for more.
    public func modify(_ image: Image) -> Image {
        return image.withAlignmentRectInsets(alignmentInsets)
    }
}
#endif
