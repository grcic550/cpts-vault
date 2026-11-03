export const PreservedNotes = ({children}) => {
  useEffect(() => {
    const reveal = () => {
      let id;
      try { id = decodeURIComponent(window.location.hash.slice(1)); } catch { return; }
      if (!id) return;
      const target = document.getElementById(id);
      const section = target?.closest('details[data-preserved-notes]');
      if (!section) return;
      section.open = true;
      requestAnimationFrame(() => target.scrollIntoView({block:'start'}));
    };
    reveal();
    window.addEventListener('hashchange', reveal);
    return () => window.removeEventListener('hashchange', reveal);
  }, []);
  return <details data-preserved-notes="true">
    <summary>Open preserved earlier notes and worked examples</summary>
    {children}
  </details>;
};
