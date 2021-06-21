#ifndef LATEX_UNI_CHAR_H
#define LATEX_UNI_CHAR_H

#include "utils/utils.h"
#include "otf/glyph.h"

namespace tex {

/** Represents a character-glyph to be measured and drawn with its font, glyph id and scale */
struct Char final {
  /** The original code point of the character */
  const c32 _code = 0;
  /** The mapped code point (by math style) of the character */
  const c32 _mappedCode = 0;
  /** The font id */
  const i32 _font = -1;
  /** The glyph id, -1 if no corresponding glyph in the font */
  const i32 _glyph = -1;

  /** The glyph scale, can be modified during using */
  float _scale = 1.f;

  /**
   * Create a char-glyph with only font and glyph, the Unicode code point is 0.
   * <p>
   * Notice that the char-glyph is valid even if its Unicode is 0, because many glyph has no
   * corresponding Unicode code point.
   */
  static inline Char onlyGlyph(i32 font, i32 glyph, float scale = 1.f) {
    return {0, 0, font, glyph, scale};
  }

  /** Test if current glyph is valid, basically the #_glyph >= 0 */
  bool isValid() const;

  /** The glyph of this char-glyph */
  const Glyph* glyph() const;

  /** The width of this char-glyph */
  float width() const;

  /** The height of this char-glyph */
  float height() const;

  /** The depth of this char-glyph, in positive */
  float depth() const;

  /** The italic correction of this char-glyph */
  float italic() const;

  /** Get the position (shift) to attach top accent */
  float topAccentAttachment() const;

  /** Get the number of vertical larger variants */
  u16 vLargerCount() const;

  /**
   * Get the vertical larger version of this char-glyph, return the copy of
   * this if no larger version was found. The index 0 is this itself.
   */
  Char vLarger(u32 index) const;

  /** Get the number of horizontal larger variants */
  u16 hLargerCount() const;

  /**
   * Get the horizontal larger version of this char-glyph, return the copy of
   * this if no larger version was found. The index 0 is this itself.
   */
  Char hLarger(u32 index) const;
};

}

#endif //LATEX_UNI_CHAR_H